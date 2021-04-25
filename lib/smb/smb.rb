require 'ruby_smb'
module Intrigue
  module Ident
    module Smb
      include Intrigue::Ident::SimpleSocket

      # gives us the recog Smb matchers
      def generate_smb_request_and_check(ip, port = 445, _debug = false)
        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        response_hash = grab_response_smb(ip, port)
        details = {
          'details' => response_hash
        }
        results = []

        # generate the checks
        checks = []
        unless Intrigue::Ident::Smb::CheckFactory.checks.nil?
          checks = Intrigue::Ident::Smb::CheckFactory.checks.map do |x|
            x.new.generate_checks
          end.compact.flatten
        end
        # and run them against our result
        checks.each do |check|
          results << match_smb_response_hash(check, details)
        end
        { 'fingerprint' => results.uniq.compact, 'response' => response_hash, 'content' => [] }
      end

      private

      def grab_response_smb(ip, port, _timeout = 30)
        # if socket = connect_tcp(ip, port, timeout)
        sock = TCPSocket.new ip, port
        dispatcher = RubySMB::Dispatcher::Socket.new(sock)
        client = RubySMB::Client.new(dispatcher, username: '', password: '')

        out = {}
        begin
          out[:protocol] = client.negotiate
          client_auth = client.authenticate
          out[:description] = client_auth.description
          out[:connection_status] = client_auth.name
        rescue StandardError => e
          out[:connection_failure] = "#{ip}: #{e.message}"
        end

        begin
          out[:native_os] = client.peer_native_os if client.peer_native_os
          out[:native_auth] = client.peer_native_lm if client.peer_native_lm
          out[:netbios_name] = client.default_name if client.default_name
          out[:netbios_domain] = client.default_domain if client.default_domain
          out[:fqdn_of_the_computer] = client.dns_host_name if client.dns_host_name
          out[:fqdn_of_the_domain] = client.dns_domain_name if client.dns_domain_name
          out[:fqdn_of_the_forest] = client.dns_tree_name if client.dns_tree_name
          out[:dialect] = client.dialect if client.dialect
          out[:os_version] = client.os_version if client.os_version
        rescue StandardError
          # prevent failure
        end
        out
        # out.to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
      end
    end
  end
end
