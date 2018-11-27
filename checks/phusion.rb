module Intrigue
module Ident
module Check
    class Phusion < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "application",
            :vendor => "Phusion",
            :product =>"Passenger",
            :match_details =>"x-powered-by header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-powered-by: Phusion Passenger.*$/,
            :dynamic_version => lambda{|x| _first_header_capture(x,/x-powered-by: Phusion Passenger (.*)/) },
            :paths => ["#{url}"]
          },
          {
            :type => "application",
            :vendor => "Phusion",
            :product =>"Passenger",
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:.*Phusion Passenger.*$/,
            :dynamic_version => lambda{|x| _first_header_capture(x,/server:.*Phusion Passenger\ ([\d\.]*).*/) },
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
