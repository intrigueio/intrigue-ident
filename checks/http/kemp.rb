module Intrigue
  module Ident
  module Check
  class Kemp < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["COTS", "Appliance", "Administrative"],
          :vendor => "Kemp",
          :product => "Edge Security Pack",
          :match_details => "lm_auth_proxy?LMimage=",
          :website => "https://kemptechnologies.com/loadmaster-family-virtual-server-load-balancers-application-delivery-controllers/",
          :match_type => :content_body,
          :version => nil,
          :references => [
            "https://support.kemptechnologies.com/hc/en-us/articles/203125029-Edge-Security-Pack-ESP-"
          ],
          :match_content =>  /lm_auth_proxy\?LMimage\=/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ]
        }
      ]
    end
  
  end
  end
  end
  end
  