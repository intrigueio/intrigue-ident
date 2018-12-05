module Intrigue
module Ident
module Check
    class ExpressJS < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "ExpressJS",
            :product =>"Express",
            :version => nil,
            :match_details =>"x-powered-by header",
            :match_type => :content_headers,
            :match_content =>  /x-powered-by: Express/,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
