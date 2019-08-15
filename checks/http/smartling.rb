module Intrigue
module Ident
module Check
    class Smartling < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          { # Magnolia CMS?
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS", "CMS"],
            :vendor =>"Smartling",
            :product =>"Smartling",
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^x-server: Smartling$/i, 
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
