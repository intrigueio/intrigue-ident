module Intrigue
  module Ident
    module ElasticSearch
      include Intrigue::Ident::SimpleSocket

      def generate_elastic_search_request_and_check(ip, port = 9200, debug = false)
        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        banner_string = grab_banner_elastic_search(ip, port)
        details = {
          "details" => {
            "response_body" => banner_string,
          },
        }

        results = []

        # generate the checks
        checks = []
        if Intrigue::Ident::ElasticSearch::CheckFactory.checks != nil
          checks = Intrigue::Ident::ElasticSearch::CheckFactory.checks.map {
            |x|
            x.new.generate_checks
          }.compact.flatten
        end
        # and run them against our result
        checks.each do |check|
          results << match_elastic_search_response_hash(check, details)
        end

        { "fingerprint" => (results).uniq.compact, "banner" => banner_string, "content" => [] }
      end

      private

      def grab_banner_elastic_search(ip, port, timeout = 30)
        response_hash = ident_http_request :get, "#{ip}:#{port}/_cluster/health", nil, {}, nil, false
        if response_hash[:timeout]
          puts "ERROR timed out on #{target_url}" if debug
          timeout_count += 1
        end
        out = response_hash[:response_body]

        "#{out}".encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
      end
    end
  end
end
