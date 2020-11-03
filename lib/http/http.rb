# encoding: utf-8

module Intrigue
module Ident
module Http

  # gives us the recog http matchers 
  include Intrigue::Ident::RecogWrapper::Http 

  # Used by intrigue-core... note that this will currently fail unless
  def generate_http_requests_and_check(url, opts={})

    dom_checks = opts[:enable_browser] || false
    debug = opts[:debug] || false
    only_base = opts[:'only-check-base-url']

    # gather all fingeprints for each product
    # this will look like an array of checks, each with a uri and a set of checks
    initial_checks = Intrigue::Ident::Http::CheckFactory.generate_initial_checks("#{url}")

    ##### 
    ##### Sanity check!
    #####
    failing_checks = initial_checks.select{|x| x if !x[:paths] }
    if failing_checks.compact.count > 0
      puts "FATAL! Unable to continue, the following checks are invalid, missing a path!"
      puts failing_checks.inspect
      return
    end

    ###
    ### Initial Checks
    ###

    # In order to ensure we check all urls associated with a check, we need to
    # group them up by each path, which is annoying because they're stored in
    # an array on each check. This line handles that. (take all the checks []
    # with each of their paths [], flatten and group by them

    initial_checks_by_path = initial_checks.map{|c| c[:paths].map{ |p|
      c.merge({:unique_path => p[:path], :follow_redirects => p[:follow_redirects] }).except(:paths) }}.flatten

    # now we have them organized by a single path, group them up so we only
    # have to make a single request per unique path 
    grouped_initial_checks = initial_checks_by_path.group_by{|x| [ x[:unique_path], x[:follow_redirects] ]  }

    # allow us to only select the base path (speeds things up)
    if only_base
      grouped_initial_checks = grouped_initial_checks.select{|x,y| x == url}
    end

    # Run'm!!!
    initial_results = run_grouped_http_checks(url, grouped_initial_checks, dom_checks, debug)

    ###
    ### APPLY THE RECOG (ONLY FIRST PAGE)!
    ###
    # now run recog against the current grab
    recog_results = []
    #first_response = initial_results["responses"].first
    #if first_response && first_response[:response_headers]
    #  server_headers = first_response[:response_headers].select{|x| x =~ /^server:.*$/i }
    #  if server_headers.count > 0 
    #    recog_results << recog_match_http_server_banner(server_headers.first)
    #  end
    #
    #  cookies_headers = first_response[:response_headers].select{|x| x =~ /^set-cookie:.*$/i }
    #  if cookies_headers.count > 0 
    #    recog_results << recog_match_http_cookies(cookies_headers.first)
    #  end
    #end

    ###
    ### Follow-on Checks
    ### 

    ### Okay so, now we have a set of detected products, let's figure out our follown checks by product
    followon_checks = []
    detected_products = initial_results["fingerprint"].map{|x| x["product"] }.uniq
    detected_products.each do |prod|
      followon_checks.concat(Intrigue::Ident::Http::CheckFactory.generate_checks_for_product("#{url}", prod))
    end
   
    ### Okay so, now we have a set of detected products, let's figure out our follown checks by vendor_product
    detected_vendor_products = initial_results["fingerprint"].map{|x| [x["vendor"], x["product"]] }.uniq
    detected_vendor_products.each do |vendor, product|
      followon_checks.concat(Intrigue::Ident::Http::CheckFactory.generate_checks_for_vendor_product("#{url}", vendor, product))
    end    

    # group them up by path (there can be multiple paths)
    followon_checks_by_path = followon_checks.map{|c| c[:paths].map{ |p|
      c.merge({:unique_path => p[:path], :follow_redirects => p[:follow_redirects] }).except(:paths) } }.flatten

    # group'm as needed to run the checks
    grouped_followon_checks = followon_checks_by_path.group_by{|x| [ x[:unique_path], x[:follow_redirects] ] }
    
    # allow us to only select the base path (speeds things up)
    if only_base
      grouped_followon_checks = grouped_followon_checks.select{|x,y| x == url}
    end

    ### OKAY NOW WE HAVE a set of output that we can run product-specific checks on, run'm
    if grouped_followon_checks
      followon_results = run_grouped_http_checks(url, grouped_followon_checks, dom_checks, debug)
    else
      followon_results = {
        "fingerprint" => [], 
        "content" => [],
        "responses" => [],
        "check_count" => []
      }
    end
  
    ###
    ### Generate output
    ###
    out = {
      "url" => initial_results["url"], # same
      "fingerprint" => (initial_results["fingerprint"] + followon_results["fingerprint"] + recog_results.flatten).uniq,
      "content" => initial_results["content"].concat(followon_results["content"]),
      "responses" => initial_results["responses"].concat(followon_results["responses"]),
      "initial_checks" => initial_results["check_count"],
      "followon_checks" => followon_results["check_count"]
    }

  out 
  end

  private

  def run_grouped_http_checks(url, grouped_generated_checks, dom_checks, debug)

    # shove results into an array
    results = []

    # keep an array of the request / response details
    responses = []

    # keep track of timeouts
    timeout_count = 0

    # call the check on each uri
    grouped_generated_checks.each do |ggc, checks|

      target_url = ggc.first

      # TODO ... this should probably be a hash
      follow_redirects = ggc.last 

      if timeout_count > 2
        puts "Skipping #{target_url}, too many timeouts" if debug
        next 
      end
      
      # get the response using a normal http request
      puts "Getting #{target_url}" if debug
      response_hash = ident_http_request :get, "#{target_url}", nil, {}, nil, follow_redirects
    
      if response_hash[:timeout]
        puts "ERROR timed out on #{target_url}" if debug
        timeout_count += 1
      end 

      responses << response_hash

      # Go ahead and match it up if we got a response!
      if response_hash
        
        # call each check, collecting the product if it's a match
        ###
        ### APPLY THE IDENT!
        ###
        checks.each do |check|

          # if we have a check that should match the dom, run it
          if (check[:match_type] == :content_dom)
            results << match_browser_response_hash(check,browser_response) if dom_checks
          else #otherwise use the normal flow
            #puts "Working on check: #{check} vs response: #{response_hash}"
            results << match_http_response_hash(check,response_hash)
          end
        end

      end
    end

    return nil unless results

    # Return all matches, minus the nils (non-matches), and grouped by check type
    out = results.compact.group_by{|x| x["type"] }

    # make sure we have an empty fingerprints array if we didnt' have any Matches
    out["check_count"] = grouped_generated_checks.map{|url,checks| {"url" => url.first, "count" => checks.count } }
    out["fingerprint"] = [] unless out["fingerprint"]
    out["content"] = [] unless out["content"]

    # only return unique results
    out["fingerprint"] = out["fingerprint"].uniq
    out["content"] = out["content"].uniq
    out["url"] = url

    # attach the responses
    out["responses"] = responses
    
  out
  end

  #require_relative 'content_helpers'
  #include Intrigue::Ident::Content::HttpHelpers

  def ident_encode(string)
    string.force_encoding('ISO-8859-1').encode('UTF-8').gsub("\u0000","")
  end

  def ident_http_request(method, uri_string, credentials=nil, headers={}, data=nil, follow_redirects=true, attempts_limit=3, timeout=10)

    # set user agent unless one was provided
    unless headers["User-Agent"]
      headers["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36"
    end

    begin 

      options = {}

      # always
      options[:timeout] = timeout
      options[:ssl_verifyhost] = 0
      options[:ssl_verifypeer] = false 

      # follow redirects if we're told
      if follow_redirects 
        options[:followlocation] = true
      end

      # if we're a post, set our body 
      if method == :post
        options[:body] = data
      end

      # merge in credentials, must be in format :user => 'username', :password => 'password'
      if credentials
        options[:userpwd] = "#{credentials[:user]}:#{credentials[:password]}"
      end

      # create a request
      request = Typhoeus::Request.new(uri_string, {
        method: method,
        headers: headers
      }.merge!(options))

      # run the request 
      response = request.run

    # catch th
    rescue Typhoeus::Errors::TyphoeusError => e
      @task_result.logger.log_error "Request Error: #{e}" if @task_result
      puts "Request Error: #{e}" unless @task_result
    end

    # fail unless we get a response
    unless response
      if @task_result
        @task_result.logger.log_error "Unable to get a response"
      else
        puts "Unable to get a response"
      end
      return nil 
    end

    #scheme = "#{response.port}" =~ /443/ ? "https" : "http"
    
    # generate our output
    out = {
      :options => options,
      :start_url => uri_string,
      :final_url => response.effective_url,
      :redirect_count => response.redirect_count,
      :request_type => :ruby,
      :request_method => method,
      #:request_credentials => credentials,
      :request_headers => headers,
      :request_data => data,
      #:request_attempts_limit => limit,
      #:request_attempts_used => attempts,
      :request_user_agent => headers["User-Agent"],
      #:request_proxy => proxy_config,
      #:response_urls => response_urls,
      :response_object => response
    }

    # verify we have a response before adding these
    if response
      out[:response_headers] = response.headers.map{|x,y| ident_encode "#{x}: #{y}" }
      out[:response_body_binary_base64] = Base64.strict_encode64(response.body)
      out[:response_body] = ident_encode(response.body)
      out[:response_code] = response.code

      #out[:response_certificate] = certificate_hash
    end

  out
  end

end
end
end