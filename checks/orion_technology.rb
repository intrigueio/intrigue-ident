module Intrigue
module Ident
module Check
    class OrionTechnology < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","IOT"],
            :references => [
              "http://orion-technology.eu/files/products/CMS/iPIMS/iPIMS_USER_MANUAL_Orion.pdf"
            ],
            :vendor => "Orion Technology",
            :product =>"IPIMS",
            :match_details =>"unique header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-ipims-enabled:.*/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
