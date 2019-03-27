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
            :paths => ["#{url}"], 
            :inference => false
          }, 
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","Payments"],
            :vendor => "Magento",
            :product =>"Magento",
            :match_details =>"Magento",
            :match_type => :content_headers,
            :version => nil,
            :match_content =>  /^x-magento-cache-debug:.*$/i,
            :paths => ["#{url}"], 
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","Payments"],
            :vendor => "Magento",
            :product =>"Magento",
            :match_details =>"Magento",
            :match_type => :content_headers,
            :version => nil,
            :match_content =>  /^x-magento-cache-control:.*$/i,
            :paths => ["#{url}"], 
            :inference => false
          },
          
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","Payments"],
            :vendor => "Magento",
            :product =>"Magento",
            :match_details =>"Magento",
            :match_type => :content_headers,
            :version => nil,
            :match_content =>  /^x-magento-tags:.*$/i,
            :paths => ["#{url}"], 
            :inference => false
          }          
        ]
      end

    end
  end
  end
  end
