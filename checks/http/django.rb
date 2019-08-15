module Intrigue
module Ident
module Check
    class Django < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "Django",
            :product =>"Django",
            :version => nil,
            :match_details =>"Django Admin Page",
            :match_type => :content_body,
            :match_content =>  /Django site admin/,
            :paths => ["#{url}/admin"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
