module Intrigue
module Ident
module Check
    class Nginx < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor => "Nginx",
            :product =>"Nginx",
            :match_details =>"Nginx",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: nginx/i,
            :dynamic_version => lambda { |x| 
              _first_header_capture(x,/server:.*nginx\/([\d\.]*).*/i) },
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor => "Nginx",
            :product =>"Nginx",
            :match_details =>"nginx default 404 page - TODO needs multiline",
            :version => nil,
            :match_type => :content_body,
            :match_content => /<hr><center>nginx<\/center>/i,
            :hide => true,
            :paths => ["#{url}"],
            :inference => true
          }
        ]
      end

    end
  end
  end
  end
