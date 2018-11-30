module Intrigue
module Ident
module Check
    class Netscape < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor => "Netscape",
            :product =>"Enterprise",
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /Server: Netscape-Enterprise.*/i,
            :dynamic_version => lambda { |x| _first_header_capture(x,/Server: Netscape-Enterprise\/([\d\.]*).*/i) },
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
