require 'snmp'

module Intrigue
  module Ident
    module Snmp

      include Intrigue::Ident::SimpleSocket

      # gives us the recog snmp matchers 
      include Intrigue::Ident::RecogWrapper::Snmp

      def generate_snmp_request_and_check(ip, port=161, debug=false)
        
        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        banner_string = grab_banner_snmp(ip,port)
        details = {
          "details" => {
            "banner" => banner_string
          }
        }

        results = []

        # generate the checks 
        checks = Intrigue::Ident::Snmp::CheckFactory.checks.map{ |x| x.new.generate_checks }.compact.flatten

        # and run them against our result
        checks.each do |check|
          results << match_snmp_response_hash(check,details)
        end
        
        # Run recog across the banner
        recog_results = recog_match_snmp_banner(banner_string)
  
      { "fingerprint" => (results + recog_results).uniq.compact, "banner" => banner_string, "content" => [] }
      end

      private

      def grab_banner_snmp(ip, port=161, community="public", timeout=60)
          
        snmp_args = { :host => ip, :port => port, :community => community, :timeout => timeout }
        out = ""
        begin 
          SNMP::Manager.open(snmp_args) do |manager|
              response = manager.get(["sysDescr.0", "sysName.0"])
              response.each_varbind do |vb|
                out << "#{vb.value.to_s}"
              end
          end
        rescue Socketry::TimeoutError
          puts "Error connecting! Timeout!"
          return nil
        end

      "#{out}".encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
      end

    end
  end
end
