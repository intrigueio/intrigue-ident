module Intrigue
  module Ident
    module MongoDb
      include Intrigue::Ident::MongoDbWire

      # gives us the recog MongoDb matchers
      def generate_mongodb_request_and_check(ip, port = 143, debug = false)

        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        banner_string = grab_banner_mongodb(ip, port)
        details = {
          "details" => {
            "banner" => banner_string,
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

        # Run recog across the banner

        { "fingerprint" => (results).uniq.compact, "banner" => banner_string, "content" => [] }
      end

      private

      def grab_banner_mongodb(ip, port, timeout = 30)
        if mongo = connect_to_mongo(ip, port, timeout)
          begin
            db = mongo.database
            bson = db.command(:ismaster => 1).first

            connectionResult = mongo.with(database: "test",
                                          user: "test",
                                          password: "123")

            out = bson.to_s + connectionResult.to_s
            out += db.collections.to_s
          rescue Errno::EHOSTUNREACH => e
            puts "Error while reading cant reach! Reset."
            out = nil
          rescue Errno::ECONNRESET => e
            puts "Error while reading! Reset."
            out = nil
          rescue Mongo::Error::OperationFailure => e
            out += e.message
          rescue Mongo::Error::NoServerAvailable => e
            out = nil
          ensure
            mongo.close
          end
        else
          out = nil
        end

        "#{out}".encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
      end
    end
  end
end
