module Intrigue
  module Ident
  module Check
  class AfterMarketPl < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "AfterMarketPL",
          :product => "AfterMarketPL",
          :website => "https://www.aftermarket.pl/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /<\/strong> has been registered on <strong>/i,
          :match_details => "<\/strong> has been registered on <strong>",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "AfterMarketPL",
          :product => "AfterMarketPL",
          :website => "https://www.aftermarket.pl/",
          :references => [],
          :version => nil,
          :match_type => :content_title,
          :match_content => /AfterMarket\.pl :: domain /i,
          :match_details => "AfterMarket\.pl :: domain ",
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
