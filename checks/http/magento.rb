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
            :match_details =>"cookie",
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
            :match_details =>"cache header",
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
            :match_details =>"cacheing header",
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
            :match_details =>"tags header",
            :match_type => :content_headers,
            :version => nil,
            :match_content =>  /^x-magento-tags:.*$/i,
            :paths => ["#{url}"], 
            :inference => false
          }, 
          { # also... /skin/frontend/default/default/css/styles.css
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","Payments"],
            :vendor => "Magento",
            :product =>"Magento",
            :match_details =>"cookies js file",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /old school cookie functions grabbed off the web/i,
            :paths => ["#{url}/js/mage/cookies.js"], 
            :inference => false
          },           
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","Payments"],
            :vendor => "Magento",
            :product =>"Magento",
            :match_details =>"release notes file",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /==== [\d\.]+ ====/i,
            :dynamic_version => lambda{ |x| _first_body_capture(x, /==== ([\d\.]+) ====/i)},
            :paths => ["#{url}/RELEASE_NOTES.txt"], 
            :inference => false
          }              
        ]
      end

    end
  end
  end
  end
