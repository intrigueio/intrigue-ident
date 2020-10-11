module Intrigue
  module Ident
    module Content
      module Http

      def _body(content)
        _body_rendered(content) || _body_raw(content)
      end

      def _body_raw(content)  
        content["details"]["hidden_response_data"]
      end

      def _body_rendered(content)
        content["details"]["hidden_response_data_rendered"] 
      end

      def _body_raw_checksum(content)
        Digest::MD5.hexdigest("#{_body_raw(content)}")
      end

      def _body_raw_binary(content)  
        Base64.strict_decode64(content["details"]["hidden_response_data_binary_base64"])
      end

      def _body_raw_binary_checksum_mmh3(content)]

        # Grab the content, which is already base64'd
        encoded_content = content["details"]["hidden_response_data_binary_base64"]
        return unless encoded_content.size > 0  

        # calculate the hash, per 
        # https://gist.github.com/Techbrunch/2bff00ebf359d891d161b10b6d27ba2e
        newline_base64 = encoded_content.gsub!(/.{76}(?=.)/, '\0' + '\n')
        return nil unless newline_base64

        mmh3 = [MurmurHash3::V32.str_hash("#{newline_base64}\n")].pack('L').unpack('l').first

        puts "DEBUG: Got favicon hash: #{mmh3}"
        

      mmh3 
      end

      def _body_rendered_checksum(content)
        Digest::MD5.hexdigest("#{_body_rendered(content)}")
      end

      def _generator(content)
        content["details"]["generator"]
      end

      def _title(content)
        content["details"]["title"]
      end

      def _headers(content)
        (content["details"]["headers"] || []).join("\n")
      end

      def _cookies(content)
        content["details"]["cookies"]
      end

      def _cert_subject(content)
        content["details"]["certificate"]["subject"]
      end

      def _cert_issuer(content)
        content["details"]["certificate"]["issuer"]
      end
      
      def _code(content)
        "#{content["details"]["response_code"]}".to_i 
      end 


    end
  end
end
end