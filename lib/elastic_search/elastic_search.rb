module Intrigue
  module Ident
    module ElasticSearch
      include Intrigue::Ident::SimpleSocket

      def generate_elastic_search_request_and_check(ip, port = 9200, debug = false)
        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        banners = grab_banner_elastic_search(ip, port, debug)

        # generate the checks
        checks = []
        unless Intrigue::Ident::ElasticSearch::CheckFactory.checks.nil?
          checks = Intrigue::Ident::ElasticSearch::CheckFactory.checks.map do |x|
            x.new.generate_checks
          end.compact.flatten
        end
        # and run them against our result
        out = []
        results = []

        banners.each do |banner|
          next unless banner

          out << banner

          detail = {
            'details' => {
              'response_body' => banner
            }
          }

          checks.each do |check|
            results << match_elastic_search_response_hash(check, detail)
          end
        end

        { 'fingerprint' => results.uniq.compact, 'banner' => out, 'content' => [] }
      end

      private

      def grab_banner_elastic_search(ip, port, debug = false)
        response_hash = ident_http_request :get, "#{ip}:#{port}/_cluster/health", nil, {}, nil, debug

        out = []
        response_hash.each do |x|
          if x[:timeout]
            puts "ERROR timed out on #{target_url}" if debug
            timeout_count += 1
          end

          out.append(x[:response_body].to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?'))
        end

        out
      end
    end
  end
end
