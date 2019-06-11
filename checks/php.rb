module Intrigue
module Ident
module Check
    class Php < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor =>"PHP",
            :product =>"PHP",
            :match_details =>"x-powered-by header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-powered-by: PHP/i,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/x-powered-by: PHP\/(.*)/i)
            },
            :paths => ["#{url}"],
            :inference => true
          }, 
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor =>"PHP",
            :product =>"PHP",
            :match_details =>"PHPSESSID cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /PHPSESSID=.*/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
