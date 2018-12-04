module Intrigue
module Ident
module Check
    class Cerberus < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS"],
            :vendor => "Cerberus",
            :product =>"Ftp Server",
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:.*Cerberus.*$/,
            :dynamic_version => lambda{|x| _first_header_capture(x,/^server:.*Cerberus\/([\d\.]*)\s.*$/i) },
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
