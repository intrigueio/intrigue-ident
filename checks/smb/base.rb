module Intrigue
  module Ident
    module SmbCheck
      class Base
        include Intrigue::Ident::BannerHelpers

        def self.inherited(base)
          Intrigue::Ident::CheckFactory::BaseCheckFactory.register(base)
        end

        def _protocol_capture(content, regex, filter = [])
          return nil unless content['details'][:protocol]

          _capture(content['details'][:protocol], regex, filter)
        end

        def _description_capture(content, regex, filter = [])
          return nil unless content['details'][:description]

          _capture(content['details'][:description], regex, filter)
        end

        def _connection_status_capture(content, regex, filter = [])
          return nil unless content['details'][:connection_status]

          _capture(content['details'][:connection_status], regex, filter)
        end

        def _native_os_capture(content, regex, filter = [])
          return nil unless content['details'][:native_os]

          _capture(content['details'][:native_os], regex, filter)
        end

        def _native_auth_capture(content, regex, filter = [])
          return nil unless content['details'][:native_auth]

          _capture(content['details'][:native_auth], regex, filter)
        end

        def _netbios_name_capture(content, regex, filter = [])
          return nil unless content['details'][:netbios_name]

          _capture(content['details'][:netbios_name], regex, filter)
        end

        def _netbios_domain_capture(content, regex, filter = [])
          return nil unless content['details'][:netbios_domain]

          _capture(content['details'][:netbios_domain], regex, filter)
        end

        def _fqdn_of_the_computer_capture(content, regex, filter = [])
          return nil unless content['details'][:fqdn_of_the_computer]

          _capture(content['details'][:fqdn_of_the_computer], regex, filter)
        end

        def _fqdn_of_the_domain_capture(content, regex, filter = [])
          return nil unless content['details'][:fqdn_of_the_domain]

          _capture(content['details'][:fqdn_of_the_domain], regex, filter)
        end

        def _fqdn_of_the_forest_capture(content, regex, filter = [])
          return nil unless content['details'][:fqdn_of_the_forest]

          _capture(content['details'][:fqdn_of_the_forest], regex, filter)
        end

        def _dialect_capture(content, regex, filter = [])
          return nil unless content['details'][:dialect]

          _capture(content['details'][:dialect], regex, filter)
        end

        def _os_version_capture(content, regex, filter = [])
          return nil unless content['details'][:os_version]

          _capture(content['details'][:os_version], regex, filter)
        end

        def _capture(content, regex, filter)
          x = content.match(regex)
          if x && x.captures
            x = x.captures.first.strip
            filter.each { |f| x.gsub!(f, '') }
            x = x.strip
            return x if x.length > 0
          end
          nil
        end
      end
    end
  end
end
