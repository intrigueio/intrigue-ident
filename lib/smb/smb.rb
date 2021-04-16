require 'ruby_smb'
module Intrigue
  module Ident
    module Smb
      include Intrigue::Ident::SimpleSocket

      # gives us the recog Smb matchers
      def generate_smb_request_and_check(ip, port = 139, _debug = false)
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
        # client = RubySMB::Client.new(dispatcher, username: '', password: '')
        client = RubySMB::Client.new(dispatcher, username: 'msfadmin', password: 'msfadmin')
        require 'pry'; binding.pry

        client.negotiate
        client.authenticate
        # begin
        #   tree = client.tree_connect('TEST_SHARE')
        #   puts "Connected to #{path} successfully!"
        # rescue StandardError => e
        #   puts "Failed to connect to #{path}: #{e.message}"
        # end

        # files = tree.list(directory: 'subdir1')

        # files.each do |file|
        #   create_time = file.create_time.to_datetime.to_s
        #   access_time = file.last_access.to_datetime.to_s
        #   change_time = file.last_change.to_datetime.to_s
        #   file_name   = file.file_name.encode('UTF-8')

        #   puts "FILE: #{file_name}\n\tSIZE(BYTES):#{file.end_of_file}\n\tSIZE_ON_DISK(BYTES):#{file.allocation_size}\n\tCREATED:#{create_time}\n\tACCESSED:#{access_time}\n\tCHANGED:#{change_time}\n\n"
        # end

        out.to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
      end
    end
  end
end
