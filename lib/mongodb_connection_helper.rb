#https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/mongodb/mongodb_login.rb

module Intrigue
  module Ident
    module MongoConnectionHelper
      include Intrigue::Ident::SimpleSocket
      port_ = 0
      ip_ = 0
      $socket = nil

      def connect_to_mongo_v2(ip, port, timeout)
        unless ip && port
          puts "Missing IP or Port! Refused."
          return nil
        end
        port_ = port
        ip_ = ip

        begin
          $socket = connect_tcp(ip, port, timeout)

          if require_auth?
            do_login("user", "somepass")
          else
            return "this MongoDB server is not using authentication"
          end
        rescue => e
          puts "Error connecting! #{e.message}"
          return nil
        end
      end

      def do_login(user, password)
        nonce = get_nonce
        status = auth(user, password, nonce)
        return status.inspect.gsub(/((\\x(..))+)/, " ")
      end

      def auth(user, password, nonce)
        request_id = (0...4).map { (65 + rand(26)).chr }.join
        packet = request_id           # requestID
        packet << "\xff\xff\xff\xff"   # responseTo
        packet << "\xd4\x07\x00\x00"  # opCode (2004 OP_QUERY)
        packet << "\x00\x00\x00\x00"   # flags
        # packet << datastore["DB"] + ".$cmd" + "\x00" # fullCollectionName (DB.$cmd)
        packet << "test" + ".$cmd" + "\x00"
        packet << "\x00\x00\x00\x00"   # numberToSkip (0)
        packet << "\xff\xff\xff\xff"   # numberToReturn (1)

        #{"authenticate"=>1.0, "user"=>"root", "nonce"=>"94e963f5b7c35146", "key"=>"61829b88ee2f8b95ce789214d1d4f175"}
        document = "\x01\x61\x75\x74\x68\x65\x6e\x74\x69\x63\x61\x74\x65"
        document << "\x00\x00\x00\x00\x00\x00\x00\xf0\x3f\x02\x75\x73\x65\x72\x00"
        document << [user.length + 1].pack("L") # +1 due null byte termination
        document << user + "\x00"
        document << "\x02\x6e\x6f\x6e\x63\x65\x00\x11\x00\x00\x00"
        document << nonce + "\x00"
        document << "\x02\x6b\x65\x79\x00\x21\x00\x00\x00"
        document << Digest::MD5.hexdigest(nonce + user + Digest::MD5.hexdigest(user + ":mongo:" + password)) + "\x00"
        document << "\x00"
        # Calculate document length
        document.insert(0, [document.length + 4].pack("L"))

        packet += document

        # Calculate messageLength
        # packet.insert(0, [(packet.length + 4)].pack("L"))  #messageLength
        packet.insert(0, [(packet.length + 4)].pack("L").force_encoding("UTF-8"))  #messageLength
        $socket.writepartial(packet)
        response = $socket.readpartial(1024, timeout: 30)

        unless have_auth_error?(response)
          response << "#{ip_} MongoDB - SUCCESSFUL LOGIN '#{user}' : '#{password}'"
        end
        return response
      end

      def require_auth?
        request_id = (0...4).map { (65 + rand(26)).chr }.join
        packet = "\x3f\x00\x00\x00"   # messageLength (63)
        packet << request_id           # requestID
        packet << "\xff\xff\xff\xff"   # responseTo
        packet << "\xd4\x07\x00\x00"  # opCode (2004 OP_QUERY)
        packet << "\x00\x00\x00\x00"   # flags
        packet << "\x61\x64\x6d\x69\x6e\x2e\x24\x63\x6d\x64\x00" # fullCollectionName (admin.$cmd)
        packet << "\x00\x00\x00\x00"   # numberToSkip (0)
        packet << "\x01\x00\x00\x00"   # numberToReturn (1)
        # query ({"listDatabases"=>1})
        packet << "\x18\x00\x00\x00\x10\x6c\x69\x73\x74\x44\x61\x74\x61\x62\x61\x73\x65\x73\x00\x01\x00\x00\x00\x00"

        $socket.writepartial(packet)
        response = $socket.readpartial(1024, timeout: 30)

        have_auth_error?(response)
      end

      def get_nonce
        request_id = (0...4).map { (65 + rand(26)).chr }.join
        packet = "\x3d\x00\x00\x00"   # messageLength (61)
        packet << request_id           # requestID
        packet << "\xff\xff\xff\xff"   # responseTo
        packet << "\xd4\x07\x00\x00"  # opCode (2004 OP_QUERY)
        packet << "\x00\x00\x00\x00"   # flags
        packet << "\x74\x65\x73\x74\x2e\x24\x63\x6d\x64\x00" # fullCollectionName (test.$cmd)
        packet << "\x00\x00\x00\x00"   #numberToSkip (0)
        packet << "\x01\x00\x00\x00"   #numberToReturn (1)
        # query {"getnonce"=>1.0}
        packet << "\x17\x00\x00\x00\x01\x67\x65\x74\x6e\x6f\x6e\x63\x65\x00\x00\x00\x00\x00\x00\x00\xf0\x3f\x00"

        $socket.writepartial(packet)
        response = $socket.readpartial(1024, timeout: 30)
        documents = response[36..1024]
        #{"nonce"=>"f785bb0ea5edb3ff", "ok"=>1.0}
        nonce = documents[15..30]
      end

      def have_auth_error?(response)
        # Response header 36 bytes long
        documents = response[36..1024]
        #{"errmsg"=>"auth fails", "ok"=>0.0}
        #{"errmsg"=>"need to login", "ok"=>0.0}
        if documents.include?("errmsg")
          return true
        else
          return false
        end
      end
    end
  end
end
