module Intrigue
  module Ident
    module MongoDb
      include Intrigue::Ident::MongoConnectionHelper

      # gives us the recog MongoDb matchers
      def generate_mongodb_request_and_check(ip, port = 27017, debug = false)

        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        response_string = grab_response_mongodb(ip, port)
        details = {
          "details" => {
            "response" => response_string,
          },
        }

        results = []

        # generate the checks
        checks = []
        if Intrigue::Ident::MongoDb::CheckFactory.checks != nil
          checks = Intrigue::Ident::MongoDb::CheckFactory.checks.map {
            |x|
            x.new.generate_checks
          }.compact.flatten
        end
        # and run them against our result
        checks.each do |check|
          results << match_mongodb_response_hash(check, details)
        end
        { "fingerprint" => (results).uniq.compact, "response" => response_string, "content" => [] }
      end

      private

      def grab_response_mongodb(ip, port, timeout = 30)
        out = connect_to_mongo_v2(ip, port, timeout)

        "#{out}".encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
      end
    end
  end
end
