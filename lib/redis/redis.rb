require 'redis'

module Intrigue
  module Ident
    module Redis

      #include Intrigue::Ident::SimpleSocket

      # gives us the recog redis matchers 
      #include Intrigue::Ident::RecogWrapper::Redis

      def generate_redis_request_and_check(ip, port=6379, debug=false)
        
        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        info_hash = grab_info_redis(ip,port)
        details = {
          "details" => {
            "info" => info_hash
          }
        }

        results = []

        # generate the checks 
        checks = Intrigue::Ident::Redis::CheckFactory.checks.map{ |x| x.new.generate_checks }.compact.flatten

        # and run them against our result
        checks.each do |check|
          results << match_redis_response_hash(check,details)
        end
        
        # Run recog across the banner
        #recog_results = recog_match_info(info_hash)
  
      { "fingerprint" => (results).uniq.compact, "info" => info_hash }
      end

      #private

      def grab_info_redis(ip, port=6379, timeout=60)
        redis = ::Redis.new(host: ip, port: port, timeout: timeout)
        out = redis.info
      out
      end

    end
  end
end
