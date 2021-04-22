require 'ruby_smb'
module Intrigue
  module Ident
    module Smb
      include Intrigue::Ident::SimpleSocket

      # gives us the recog Smb matchers
      def generate_smb_request_and_check(ip, port = 445, _debug = false)
        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        response_string = grab_response_smb(ip, port)
        details = {
          'details' => {
            'response' => response_string
          }
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
        { 'fingerprint' => results.uniq.compact, 'response' => response_string, 'content' => [] }
      end

      private

      def grab_response_smb(ip, port, _timeout = 30)
        # if socket = connect_tcp(ip, port, timeout)
        sock = TCPSocket.new ip, port
        dispatcher = RubySMB::Dispatcher::Socket.new(sock)
        client = RubySMB::Client.new(dispatcher, username: '', password: '')

        out = []
        begin
          out << "Protocol: #{client.negotiate}"
          client_auth = client.authenticate
          out << "Description: #{client_auth.description}"
          out << "Connection Status: #{client_auth.name}"
        rescue StandardError => e
          out = "Failed to connect to #{ip}: #{e.message}"
        end

        begin
          out << "Native OS: #{client.peer_native_os}" if client.peer_native_os
          out << "Native auth: #{client.peer_native_lm}" if client.peer_native_lm
          out << "Netbios Name: #{client.default_name}" if client.default_name
          out << "Netbios Domain: #{client.default_domain}" if client.default_domain
          out << "FQDN of the computer: #{client.dns_host_name}" if client.dns_host_name
          out << "FQDN of the domain: #{client.dns_domain_name}" if client.dns_domain_name
          out << "FQDN of the forest: #{client.dns_tree_name}" if client.dns_tree_name
          out << "Dialect: #{client.dialect}" if client.dialect
          out << "OS Version: #{client.os_version}" if client.os_version
        rescue StandardError
          # prevent failure
        end
        out.to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
      end
    end
  end
end
