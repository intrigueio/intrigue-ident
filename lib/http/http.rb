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
      c.merge({:unique_path => p})} }.flatten

    # now we have them organized by a single path, group them up so we only
    # have to make a single request per unique path 
    grouped_initial_checks = initial_checks_by_path.group_by{|x| x[:unique_path] }

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
      c.merge({:unique_path => p})} }.flatten

    # group'm as needed to run the checks
    grouped_followon_checks = followon_checks_by_path.group_by{|x| x[:unique_path] }
    
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
    grouped_generated_checks.each do |ggc|

      target_url = ggc.first

      if timeout_count > 2
        puts "Skipping #{target_url}, too many timeouts" if debug
        next 
      end

      # get the response using a normal http request
      # TODO - collect redirects here
      puts "Getting #{target_url}" if debug
      response_hash = ident_http_request :get, "#{target_url}"
    
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
        ggc.last.each do |check|

          # if we have a check that should match the dom, run it
          if (check[:match_type] == :content_dom)
            results << match_browser_response_hash(check,browser_response) if dom_checks
          else #otherwise use the normal flow
            results << match_http_response_hash(check,response_hash)
          end
        end

      end
    end

    return nil unless results

    # Return all matches, minus the nils (non-matches), and grouped by check type
    out = results.compact.group_by{|x| x["type"] }

    # make sure we have an empty fingerprints array if we didnt' have any Matches
    out["check_count"] = grouped_generated_checks.map{|x| {"url" => x.first, "count" => x.last.count } }
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
    string.force_encoding('ISO-8859-1').encode('UTF-8')
  end

  ###
  ### XXX - significant updates made to zlib, determine whether to
  ### move this over to RestClient: https://github.com/ruby/ruby/commit/3cf7d1b57e3622430065f6a6ce8cbd5548d3d894
  ###
  def ident_http_request(method, uri_string, credentials=nil, headers={}, data=nil, limit = 3, open_timeout=15, read_timeout=15)

    #puts "IDENT Requesting #{uri_string}"

    response = nil
    begin

      # set user agent
      user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36"
      headers["User-Agent"] = user_agent

      attempts=0
      max_attempts=limit
      found = false
      timeout = false

      uri = URI.parse uri_string

      # keep track of redirects
      response_urls = ["#{uri}"]

      unless uri
        _log error "Unable to parse URI from: #{uri_string}"
        return
      end

      until( found || attempts >= max_attempts)

        attempts+=1

        if $global_config
          if $global_config.config["http_proxy"]
            proxy_config = $global_config.config["http_proxy"]
            proxy_addr = $global_config.config["http_proxy"]["host"]
            proxy_port = $global_config.config["http_proxy"]["port"]
            proxy_user = $global_config.config["http_proxy"]["user"]
            proxy_pass = $global_config.config["http_proxy"]["pass"]
          end
        end

        # set options
        opts = {}
        if uri.instance_of? URI::HTTPS

          opts[:use_ssl] = true
          opts[:verify_mode] = OpenSSL::SSL::VERIFY_NONE
          
          # get certificate!!
          certificate_hash = {} #ident_get_certificate(uri)
        end

        http = Net::HTTP.new(uri.host, uri.port, proxy_addr, proxy_port, opts)
        http.open_timeout = open_timeout
        #http.continue_timeout = open_timeout
        http.ssl_timeout = open_timeout
        http.read_timeout = read_timeout
        http.write_timeout = open_timeout
        http.start

        path = "#{uri.path}"
        path = "/" if path==""

        # add in the query parameters
        if uri.query
          path += "?#{uri.query}"
        end

        ### ALLOW DIFFERENT VERBS HERE
        if method == :get
          request = Net::HTTP::Get.new(uri)
        elsif method == :post
          # see: https://coderwall.com/p/c-mu-a/http-posts-in-ruby
          request = Net::HTTP::Post.new(uri)
          request.body = data
        elsif method == :head
          request = Net::HTTP::Head.new(uri)
        elsif method == :propfind
          request = Net::HTTP::Propfind.new(uri.request_uri)
          request.body = "Here's the body." # Set your body (data)
          request["Depth"] = "1" # Set your headers: one header per line.
        elsif method == :options
          request = Net::HTTP::Options.new(uri.request_uri)
        elsif method == :trace
          request = Net::HTTP::Trace.new(uri.request_uri)
          request.body = "blah blah"
        end
        ### END VERBS

        # set the headers
        headers.each do |k,v|
          request[k] = v
        end

        # handle credentials
        if credentials
          request.basic_auth(credentials[:username],credentials[:password])
        end

        # USE THIS TO PRINT HTTP REQUEST
        #request.each_header{|h| puts "#{h}: #{request[h]}" }
        # END USE THIS TO PRINT HTTP REQUEST

        # get the response
        response = http.request(request)

        ###
        ### Handle redirects 
        ### 
        location_header = response.header['location'] || response.header['Location'] 
        if location_header != nil
          # location header redirect
          #puts "Following redirect: #{location_header}"

          newuri=URI.parse(location_header)

          # handle relative uri 
          if(newuri.relative?)
            newuri=URI.parse("#{uri}#{location_header}")
          end
          
          response_urls << ident_encode(newuri.to_s)
          uri=newuri

        elsif response.body =~ /META HTTP-EQUIV=\"?Refresh/i # meta refresh
          # meta refresh redirect

          # get the URL 
          metaurl = URI.parse(response.body.scan(/META HTTP-EQUIV=Refresh CONTENT=.*; URL=(.*)"/i).first)
          
          if metaurl
            newuri = metaurl.first  
          else # unable to parse 
            puts "ERROR Unable to parse redirection!!"
            found = true 
            break 
          end
          
          # handle relative uri 
          if(newuri.relative?)
            newuri=URI.parse("#{uri}/#{newuri}")
          end
          
          response_urls << ident_encode(newuri.to_s)
          uri=newuri

        else

          found = true
          break

        end #end redirect handling

      end #until

      ###
      ### Done Handling Redirects, proactively set final_url
      ###
      final_url = uri.to_s

    ### TODO - create a global $debug config option
    
    #rescue ArgumentError => e
      #puts "Unable to connect #{uri}: #{e}"
    rescue Net::OpenTimeout => e
      #puts "Unable to connect #{uri}: #{e}"
      timeout = true
    rescue Net::ReadTimeout => e
      #puts "Unable to connect #{uri}: #{e}"
      timeout = true
    rescue Errno::ENETDOWN => e
      #puts "Unable to connect #{uri}: #{e}" 
    rescue Errno::ETIMEDOUT => e
      #puts "Unable to connect #{uri}: #{e}" 
      timeout = true
    rescue Errno::EINVAL => e
      #puts "Unable to connect #{uri}: #{e}"
    rescue Errno::ENETUNREACH => e
      #puts "Unable to connect #{uri}: #{e}"
    rescue Errno::EHOSTUNREACH => e
      #puts "Unable to connect #{uri}: #{e}"
    rescue URI::InvalidURIError => e
      #
      # XXX - This is an issue. We should catch this and ensure it's not
      # due to an underscore / other acceptable character in the URI
      # http://stackoverflow.com/questions/5208851/is-there-a-workaround-to-open-urls-containing-underscores-in-ruby
      #
      #puts "Unable to connect #{uri}: #{e}"
    rescue OpenSSL::SSL::SSLError => e
      #puts "Unable to connect #{uri}: #{e}" 
    rescue Errno::ECONNREFUSED => e
      #puts "Unable to connect #{uri}: #{e}" 
    rescue Errno::ECONNRESET => e
      #puts "Unable to connect #{uri}: #{e}" 
    rescue Net::HTTPBadResponse => e
      #puts "Unable to connect #{uri}: #{e}" 
    rescue Zlib::BufError => e
      #puts "Unable to connect #{uri}: #{e}" 
    rescue Zlib::DataError => e # "incorrect header check - may be specific to ruby 2.0"
      #puts "Unable to connect #{uri}: #{e}" 
    rescue EOFError => e
      #puts "Unable to connect #{uri}: #{e}" 
    rescue SocketError => e
      #puts "Unable to connect #{uri}: #{e}" 
    rescue Encoding::InvalidByteSequenceError => e
      #puts "Encoding issue #{uri}: #{e}" 
    rescue Encoding::UndefinedConversionError => e
      #puts "Encoding issue #{uri}: #{e}" 
    end

    # generate our output
    out = {
      :timeout => timeout,
      :start_url => uri_string,
      :final_url => final_url,
      :request_type => :ruby,
      :request_method => method,
      :request_credentials => credentials,
      :request_headers => headers,
      :request_data => data,
      :request_attempts_limit => limit,
      :request_attempts_used => attempts,
      :request_user_agent => user_agent,
      :request_proxy => proxy_config,
      :response_urls => response_urls,
      :response_object => response
    }

    # verify we have a response before adding these
    if response
      out[:response_headers] = response.each_header.map{|x| ident_encode "#{x}: #{response[x]}" }
      out[:response_body] = ident_encode(response.body)
      out[:response_certificate] = certificate_hash
    end

    out
  end

end
end
end