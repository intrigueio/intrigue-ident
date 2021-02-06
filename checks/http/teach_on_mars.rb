module Intrigue
    module Ident
    module Check
    module Private
    class TeachOnMars < Intrigue::Ident::Check::Base
    
      def generate_checks(url)
        [ 
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Teach On Mars",
            :product =>"Teach On Mars",
            :website => "https://www.teachonmars.com/",
            :match_details =>"Teach On Mars Web Server - Server Header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: ToM$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
          }
        ]
      end
    end
    end
    end
    end
    end
    