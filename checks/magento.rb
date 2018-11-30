module Intrigue
module Ident
module Check
    class Magento < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","Payments"],
            :vendor => "Magento",
            :product =>"Magento",
            :match_details =>"Magento",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /Mage.Cookies.path/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
