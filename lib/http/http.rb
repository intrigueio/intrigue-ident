module Intrigue
  module Ident
    module Http
      # gives us the recog http matchers
      include Intrigue::Ident::RecogWrapper::Http

      # Used by intrigue-core... note that this will currently fail unless
      def generate_http_requests_and_check(url, opts = {})
        dom_checks = opts[:enable_browser] || false
        debug = opts[:debug] || false
        only_base = opts[:'only-check-base-url']

        # gather all fingeprints for each product
        # this will look like an array of checks, each with a uri and a set of checks
        initial_checks = Intrigue::Ident::Http::CheckFactory.generate_initial_checks(url.to_s, opts)

        #####
        ##### Sanity check!
        #####
        failing_checks = initial_checks.select { |x| x unless x[:paths] }
        if failing_checks.compact.count > 0
          puts 'FATAL! Unable to continue, the following checks are invalid, missing a path!'
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

        initial_checks_by_path = initial_checks.map do |c|
          c[:paths].map do |p|
            c.merge({ unique_path: p[:path], follow_redirects: p[:follow_redirects] }).except(:paths)
          end
        end.flatten

        # now we have them organized by a single path, group them up so we only
        # have to make a single request per unique path
        grouped_initial_checks = initial_checks_by_path.group_by { |x| [x[:unique_path]] }

        # allow us to only select the base path (speeds things up)
        grouped_initial_checks = grouped_initial_checks.select { |x, _y| x == url } if only_base

        # Run'm!!!
        initial_results = run_grouped_http_checks(url, grouped_initial_checks, dom_checks, debug)

        ###
        ### APPLY THE RECOG (ONLY FIRST PAGE)!
        ###
        # now run recog against the current grab
        recog_results = []
        # first_response = initial_results["responses"].first
        # if first_response && first_response[:response_headers]
        #  server_headers = first_response[:response_headers].select{|x| x =~ /^server:.*$/i }
        #  if server_headers.count > 0
        #    recog_results << recog_match_http_server_banner(server_headers.first)
        #  end
        #
        #  cookies_headers = first_response[:response_headers].select{|x| x =~ /^set-cookie:.*$/i }
        #  if cookies_headers.count > 0
        #    recog_results << recog_match_http_cookies(cookies_headers.first)
        #  end
        # end

        ###
        ### Follow-on Checks
        ###

        ### Okay so, now we have a set of detected products, let's figure out our follown checks by product
        followon_checks = []
        detected_products = initial_results['fingerprint'].map { |x| x['product'] }.uniq
        detected_products.each do |prod|
          followon_checks.concat(Intrigue::Ident::Http::CheckFactory.generate_checks_for_product(url.to_s, prod, opts))
        end

        ### Add checks for vendors
        detected_products = initial_results['fingerprint'].map { |x| x['vendor'] }.uniq
        detected_products.each do |vendor|
          followon_checks.concat(Intrigue::Ident::Http::CheckFactory.generate_checks_for_vendor(url.to_s, vendor, opts))
        end

        ### Okay so, now we have a set of detected products, let's figure out our follown checks by vendor_product
        detected_vendor_products = initial_results['fingerprint'].map { |x| [x['vendor'], x['product']] }.uniq
        detected_vendor_products.each do |vendor, product|
          followon_checks.concat(Intrigue::Ident::Http::CheckFactory.generate_checks_for_vendor_product(url.to_s,
                                                                                                        vendor, product, opts))
        end

        # group them up by path (there can be multiple paths)
        followon_checks_by_path = followon_checks.map do |c|
          c[:paths].map do |p|
            c.merge({ unique_path: p[:path], follow_redirects: p[:follow_redirects] }).except(:paths)
          end
        end.flatten

        # group'm as needed to run the checks
        grouped_followon_checks = followon_checks_by_path.group_by { |x| [x[:unique_path]] }

        # allow us to only select the base path (speeds things up)
        grouped_followon_checks = grouped_followon_checks.select { |x, _y| x == url } if only_base

        # filter by tag if tags are set.
        if opts[:checks_with_tag] && !opts[:checks_with_tag].empty?
          initial_results['fingerprint'] =
            Intrigue::Ident::Http::CheckFactory.filter_by_tags_post_run_initial_results(
              initial_results['fingerprint'], opts
            )

          grouped_followon_checks.each do |x, fingerprint|
            grouped_followon_checks[x] = Intrigue::Ident::Http::CheckFactory.filter_by_tags_post_run(fingerprint, opts)
          end
        end

        ### OKAY NOW WE HAVE a set of output that we can run product-specific checks on, run'm
        followon_results = if grouped_followon_checks
                             run_grouped_http_checks(url, grouped_followon_checks, dom_checks, debug)
                           else
                             {
                               'fingerprint' => [],
                               'content' => [],
                               'responses' => [],
                               'check_count' => []
                             }
                           end

        ###
        ### Generate output
        ###
        {
          'url' => initial_results['url'], # same
          'fingerprint' => (initial_results['fingerprint'] + followon_results['fingerprint'] + recog_results.flatten).uniq,
          'content' => initial_results['content'].concat(followon_results['content']),
          'responses' => initial_results['responses'].concat(followon_results['responses']),
          'initial_checks' => initial_results['check_count'],
          'followon_checks' => followon_results['check_count']
        }
      end

      private

      def run_grouped_http_checks(url, grouped_generated_checks, _dom_checks, debug)
        # shove results into an array
        results = []

        # keep an array of the request / response details
        responses = []

        # keep track of timeouts
        timeout_count = 0

        # call the check on each uri
        grouped_generated_checks.each do |ggc, checks|
          target_url = ggc.first

          # TODO: ... this should probably be a hash
          follow_redirects = ggc.last

          if timeout_count > 2
            puts "Skipping #{target_url}, too many timeouts" if debug
            next
          end

          # this block should be moved to a sanitise uri function
          # if the user adds too many // to the url this will remove them
          target_url = squeez_url(target_url)
          #
          # get the response using a normal http request
          puts "Getting #{target_url}" if debug
          response_hash = ident_http_request :get, target_url, nil, {}, nil, debug

          response_hash.each do |x|
            next unless x

            if x[:timeout]
              puts "ERROR timed out on #{x[:final_url]}" if debug
              timeout_count += 1
            end
            responses << x

            checks.each do |check|
              # if we have a check that should match the dom, run it
              if check[:match_type] == :content_dom
                # skip it, no longer supported.
              else # otherwise use the normal flow
                results << match_http_response_hash(check, x)
              end
            end
          end

          # Go ahead and match it up if we got a response!

          # call each check, collecting the product if it's a match
          ###
          ### APPLY THE IDENT!
          ###
        end

        # Return all matches, minus the nils (non-matches), and grouped by check type
        out = results.flatten.compact.group_by { |x| x['type'] }

        # make sure we have an empty fingerprints array if we didnt' have any Matches
        out['check_count'] = grouped_generated_checks.map do |url, checks|
          { 'url' => url.first, 'count' => checks.count }
        end
        out['fingerprint'] = [] unless out['fingerprint']
        out['content'] = [] unless out['content']

        # only return unique results
        out['fingerprint'] = out['fingerprint'].uniq
        out['content'] = out['content'].uniq
        out['url'] = url

        # attach the responses
        out['responses'] = responses

        out
      end

      # require_relative 'content_helpers'
      # include Intrigue::Ident::Content::HttpHelpers

      def ident_encode(string)
        string.force_encoding('ISO-8859-1').encode('UTF-8').gsub("\u0000", '')
      end

      def ident_http_request(method, uri_string, credentials = nil, headers = {}, data = nil, _attempts_limit = 3, timeout = 10, debug)
        # set user agent unless one was provided
        unless headers['User-Agent']
          headers['User-Agent'] =
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36'
        end

        begin
          options = {}

          # always
          options[:timeout] = timeout
          # if we're a post, set our body
          options[:body] = data if method == :post

          # merge in credentials, must be in format :user => 'username', :password => 'password'
          options[:userpwd] = "#{credentials[:user]}:#{credentials[:password]}" if credentials

          # run the request
          response = grab_data_from_url(uri_string, method, headers, options, debug)
        rescue Typhoeus::Errors::TyphoeusError => e
          @task_result.logger.log_error "Request Error: #{e}" if @task_result
          puts "Request Error: #{e}" unless @task_result
        end

        # fail unless we get a response
        unless response[:responses]
          if @task_result
            @task_result.logger.log_error 'Unable to get a response'
          else
            puts 'Unable to get a response'
          end
          return nil
        end

        # scheme = "#{response.port}" =~ /443/ ? "https" : "http"

        # generate our output
        out = []

        response[:responses].each do |x|
          out.append({
                       options: options,
                       start_url: uri_string,
                       final_url: x.options[:effective_url],
                       request_type: :ruby,
                       request_method: method,
                       #:request_credentials => credentials,
                       request_headers: headers,
                       request_data: data,
                       #:request_attempts_limit => limit,
                       #:request_attempts_used => attempts,
                       request_user_agent: headers['User-Agent'],
                       #:request_proxy => proxy_config,
                       #:response_urls => response_urls,
                       response_object: x,
                       redirect_count: response[:redirect_count],
                       redirect_chain: response[:redirect_chain]
                     })
        end

        # verify we have a response before adding these
        if response[:responses]
          out.each do |z|
            z[:response_headers] = z[:response_object].headers.map do |x, y|
              if y.is_a?(Array)
                y.map do |v|
                  ident_encode("#{x}: #{v}")
                end
              else
                ident_encode("#{x}: #{y}")
              end
            end

            z[:response_body_binary_base64] = Base64.strict_encode64(z[:response_object].body)
            z[:response_body] = ident_encode(z[:response_object].body)
            z[:response_code] = z[:response_object].code
            # z[:response_certificate] = certificate_hash //where does this come from?
          end
        end

        out
      end

      # TODO: - Move to it's own service.
      def grab_data_from_url(uri_string, method, headers, options, debug)
        options[:ssl_verifyhost] = 0
        options[:ssl_verifypeer] = false

        # follow redirects always off.
        # this allows us to be able to chain all the redirects ourselves.
        options[:followlocation] = false

        # create a request
        request = Typhoeus::Request.new(uri_string, {
          method: method,
          headers: headers
        }.merge!(options))

        # setup hydra and required vars
        hydra = Typhoeus::Hydra.hydra
        content = {
          redirect_count: 0,
          redirect_chain: [],
          responses: []
        }

        # start building hydra nested requests
        content = build_hydra_request(hydra, request, content, debug)

        hydra.run # this is a blocking call that returns once all requests are complete

        content
      end

      def build_hydra_request(hydra, request, content, debug)
        hydra.queue request
        request.on_complete do |response|
          content[:responses].append(response)

          if response.options[:response_code].between?(299, 400) && content[:redirect_count] < 15

            content[:redirect_count] += 1

            new_url = get_redirect_location_from_header(response.options[:effective_url],
                                                        response.options[:response_headers])

            if !new_url.nil? && !new_url.empty? && new_url != request.base_url

              content[:redirect_chain].append(
                {
                  from: request.base_url,
                  to: new_url
                }
              )

              new_request = Typhoeus::Request.new(new_url, request.original_options)

              puts "-- #{content[:redirect_count]} bounce - Redirected to: #{new_url}" if debug

              build_hydra_request(hydra, new_request, content, debug)
            end
          end
        end
        content
      end

      def get_redirect_location_from_header(base, header)
        new_url = header[%r{Location:\s(https?://.*)\r}i, 1]

        # If we can't find a location that has the base start, fetch anything we can find.
        # and attach it to the base
        if new_url.nil? || new_url.empty?
          new_url = get_raw_redirect_location_from_header(header)

          if !new_url.nil? && !new_url.empty?
            new_url = squeez_url("#{base}#{new_url}")
          end
        end
        new_url
      end

      def get_raw_redirect_location_from_header(header)
        header[/Location:\s(.*)\r/i, 1]
      end

      def squeez_url(uri)
        uri = URI.parse(uri)
        uri.path.squeeze!('/')
        uri.to_s
      end

    end
  end
end
