module Intrigue
module Ident
module Check
    class Craft < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "Craft",
            :product =>"CMS",
            :match_details =>"csrf protection cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /CRAFT_CSRF_TOKEN/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "Craft",
            :product =>"CMS",
            :match_details =>"x-powered-by header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-powered-by: Craft CMS/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
