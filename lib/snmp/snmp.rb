require 'snmp'

module Intrigue
  module Ident
    module Snmp

      include Intrigue::Ident::Socket

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

      out.length > 0 ? out : nil
      end

    end
  end
end
