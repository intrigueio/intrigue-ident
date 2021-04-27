module Intrigue
  module Ident
    module Smb
      module Content
        def _protocol(content)
          content['details'][:protocol]
        end

        def _description(content)
          content['details'][:description]
        end

        def _connection_status(content)
          content['details'][:connection_status]
        end

        def _native_os(content)
          content['details'][:native_os]
        end

        def _native_auth(content)
          content['details'][:native_auth]
        end

        def _netbios_name(content)
          content['details'][:netbios_name]
        end

        def _netbios_domain(content)
          content['details'][:netbios_domain]
        end

        def _fqdn_of_the_computer(content)
          content['details'][:fqdn_of_the_computer]
        end

        def _fqdn_of_the_domain(content)
          content['details'][:fqdn_of_the_domain]
        end

        def _fqdn_of_the_forest(content)
          content['details'][:fqdn_of_the_forest]
        end

        def _dialect(content)
          content['details'][:dialect]
        end

        def _os_version(content)
          content['details'][:os_version]
        end
      end
    end
  end
end
