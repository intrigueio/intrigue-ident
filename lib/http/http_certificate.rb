module Intrigue
  module Ident
  module Http
  

  def ident_get_certificate(uri)
    begin
      hostname = uri.host
      port = uri.port

      puts "Hostname: #{hostname}"
      puts "Port: #{port}"

      # connect
      socket = ident_connect_ssl_socket(hostname,port,timeout=10)

      unless socket && socket.peer_cert
        puts "Unable to get socket or peer cert"
        return nil 
      end

      # Parse the cert
      cert = OpenSSL::X509::Certificate.new(socket.peer_cert)

      # Create an SSL Certificate entity
      # key_size = "#{cert.public_key.n.num_bytes * 8}" if cert.public_key && cert.public_key.respond_to?(:n)
      certificate_details = {
        "name" => "#{cert.subject.to_s.split("CN=").last} (#{cert.serial})",
        "version" => cert.version,
        "serial" => "#{cert.serial}",
        "not_before" => "#{cert.not_before}",
        "not_after" => "#{cert.not_after}",
        "subject" => "#{cert.subject}",
        "issuer" => "#{cert.issuer}",
        #"key_length" => key_size,
        "signature_algorithm" => "#{cert.signature_algorithm}",
        #"hidden_text" => "#{cert.to_text}"
      }
    
    rescue SocketError => e
      puts "Error: #{e}"
    rescue Errno::ECONNRESET => e
      puts "Error: #{e}"
    rescue Errno::EACCES => e
      puts "Error: #{e}"
    rescue Errno::ECONNREFUSED => e
      puts "Error: #{e}"
    rescue Errno::EHOSTUNREACH => e
      puts "Error: #{e}"
    rescue Errno::ENETUNREACH => e
      puts "Error: #{e}"
    rescue Errno::ETIMEDOUT => e
      puts "Error: #{e}"
    rescue URI::InvalidURIError => e
      puts "Error: #{e}"
      # TODO this is probably an issue with an IPv6 URL... need to be adjusted:
      # https://www.ietf.org/rfc/rfc2732.txt
    rescue OpenSSL::SSL::SSLError => e
      puts "Error: #{e}"
    end

    puts "Sending: cert #{certificate_details}"

  certificate_details
  end

  # See: https://raw.githubusercontent.com/zendesk/ruby-kafka/master/lib/kafka/ssl_socket_with_timeout.rb
  def ident_connect_ssl_socket(hostname, port, timeout=10, max_attempts=1)
    # Create a socket and connect
    # https://apidock.com/ruby/Net/HTTP/connect
    attempts=0

    begin

      # keep track of how many times we've tried
      attempts +=1

      ssl_context = OpenSSL::SSL::SSLContext.new
      #ssl_context.min_version = OpenSSL::SSL::SSL2_VERSION
      #ssl_context.ssl_version = :SSLv23

      # possible min versions:
      # OpenSSL::SSL::SSL2_VERSION
      # OpenSSL::SSL::SSL3_VERSION
      # OpenSSL::SSL::TLS1_1_VERSION
      # OpenSSL::SSL::TLS1_2_VERSION
      # OpenSSL::SSL::TLS1_VERSION

      # Open a tcp socket
      addr = Socket.getaddrinfo(hostname, nil)
      sockaddr = Socket.pack_sockaddr_in(port, addr[0][3])

      tcp_socket = Socket.new(Socket.const_get(addr[0][0]), Socket::SOCK_STREAM, 0)
      tcp_socket.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)

      # first initiate the TCP socket
      begin
        # Initiate the socket connection in the background. If it doesn't fail
        # immediately it will raise an IO::WaitWritable (Errno::EINPROGRESS)
        # indicating the connection is in progress.
          tcp_socket.connect_nonblock(sockaddr)
      rescue IO::WaitWritable
        # select will block until the socket is writable or the timeout
        # is exceeded, whichever comes first.
        unless _ident_select_with_timeout(tcp_socket, :connect_write, timeout)
          # select returns nil when the socket is not ready before timeout
          # seconds have elapsed
          tcp_socket.close
          raise Errno::ETIMEDOUT
        end

        begin
          # Verify there is now a good connection.
          tcp_socket.connect_nonblock(sockaddr)
        rescue Errno::EISCONN
          # The socket is connected, we're good!
        end

      end

      # once that's connected, we can start initiating the ssl socket
      ssl_socket = OpenSSL::SSL::SSLSocket.new(tcp_socket, ssl_context)
      ssl_socket.hostname = hostname # Required for SNI (cloudflare)

      begin
        # Initiate the socket connection in the background. If it doesn't fail
        # immediately it will raise an IO::WaitWritable (Errno::EINPROGRESS)
        # indicating the connection is in progress.
        # Unlike waiting for a tcp socket to connect, you can't time out ssl socket
        # connections during the connect phase properly, because IO.select only partially works.
        # Instead, you have to retry.
        ssl_socket.connect_nonblock
      rescue Errno::EAGAIN, Errno::EWOULDBLOCK, IO::WaitReadable
        if _ident_select_with_timeout(ssl_socket, :connect_read, timeout)
          puts "retrying... attempt: #{attempts}/#{max_attempts}"
          retry unless attempts == max_attempts
        else
          ssl_socket.close
          tcp_socket.close
          raise Errno::ETIMEDOUT
        end
      rescue IO::WaitWritable
        if _ident_select_with_timeout(ssl_socket, :connect_write, timeout)
          puts "retrying... attempt: #{attempts}/#{max_attempts}"
          retry unless attempts == max_attempts
        else
          ssl_socket.close
          tcp_socket.close
          raise Errno::ETIMEDOUT
        end
      end

    rescue OpenSSL::SSL::SSLError => e
      puts "Error requesting resource, skipping: #{hostname} #{port}: #{e}"
      puts "retrying... attempt: #{attempts}/#{max_attempts}"
      retry unless attempts == max_attempts
    rescue SocketError => e
      puts "Error requesting resource, skipping: #{hostname} #{port}: #{e}"
    rescue Errno::EINVAL => e
      puts "Error requesting resource, skipping: #{hostname} #{port}: #{e}"
    rescue Errno::EMFILE => e
      puts "Error requesting resource, skipping: #{hostname} #{port}: #{e}"
    rescue Errno::EAFNOSUPPORT => e
      puts "Error requesting resource, skipping: #{hostname} #{port}: #{e}"
    rescue Errno::EPIPE => e
      puts "Error requesting cert, skipping: #{hostname} #{port}: #{e}"
    rescue Errno::ECONNRESET => e
      puts "Error requesting cert, skipping: #{hostname} #{port}: #{e}"
    rescue Errno::ECONNREFUSED => e
      puts "Error requesting cert - refused, skipping: #{hostname} #{port}: #{e}"
      puts "Error requesting resource, skipping: #{hostname} #{port}"
      puts "retrying... attempt: #{attempts}/#{max_attempts}"
      retry unless attempts == max_attempts
    rescue Errno::ENETUNREACH
      # unable to connect
      puts "Error requesting cert, skipping: #{hostname} #{port}: #{e}"
    rescue Errno::ETIMEDOUT => e
      puts "Error requesting cert - timed out, timeout: #{hostname} #{port}: #{e}"
      puts "Error requesting resource, skipping: #{hostname} #{port}"
      puts "retrying... attempt: #{attempts}/#{max_attempts}"
      retry unless attempts == max_attempts
    rescue Errno::EHOSTUNREACH => e
      puts "Error requesting cert, skipping: #{hostname} #{port}: #{e}"
    ensure
      attempts +=1
    end

    # fail if we can't connect
    unless ssl_socket
      puts "Unable to connect!!"
      return nil
    end

  ssl_socket
  end

  def _ident_select_with_timeout(socket, type, timeout)
    case type
    when :connect_read
      IO.select([socket], nil, nil, timeout)
    when :connect_write
      IO.select(nil, [socket], nil, timeout)
    when :read
      IO.select([socket], nil, nil, timeout)
    when :write
      IO.select(nil, [socket], nil, timeout)
    end
  end

end
end
end