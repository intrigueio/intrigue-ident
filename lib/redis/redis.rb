require 'redis'

module Intrigue
  module Ident
    module Redis
      # include Intrigue::Ident::SimpleSocket

      # gives us the recog redis matchers
      # include Intrigue::Ident::RecogWrapper::Redis

      def generate_redis_request_and_check(ip, port = 6379, debug = false)
        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        info_hash = grab_info_redis(ip, port, 60 ,debug)
        return {} if info_hash.nil?
        details = {
          'details' => {
            'info' => info_hash
          }
        }

        results = []

        checks = []
        unless Intrigue::Ident::Redis::CheckFactory.checks.nil?
          # generate the checks
          checks = Intrigue::Ident::Redis::CheckFactory.checks.map do |x|
            x.new.generate_checks
          end.compact.flatten
        end
        # and run them against our result
        checks.each do |check|
          results << match_redis_response_hash(check, details)
        end

        # Run recog across the banner
        # recog_results = recog_match_info(info_hash)

        { 'fingerprint' => results.uniq.compact, 'info' => info_hash }
      end

      def grab_info_redis(ip, port = 6379, timeout = 60, debug = false)
        begin
          redis = ::Redis.new(host: ip, port: port, timeout: timeout)
          out = redis.info
        rescue ::Redis::TimeoutError => e
          p "Error - connection timed out #{ip}:#{port}"
          p e if debug
          return nil
        rescue ::Redis::ConnectionError => e
          p "Error - failed to connect to #{ip}:#{port}"
          p e if debug
          return nil
        rescue Errno::ECONNRESET => e
          p "Error - connection reset #{ip}:#{port}"
          p e if debug
          return nil
        rescue => e
          p "Error - unable to get redis information #{ip}:#{port}"
          p e if debug
          return nil
        end
        out
      end
    end
  end
end
