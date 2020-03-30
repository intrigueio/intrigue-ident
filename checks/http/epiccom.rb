module Intrigue
  module Ident
  module Check
  class EpicCom < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "EpicCom",
          :product => "EpicCom",
          :website => "https://www.epik.com/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /Why\ purchase\ this\ domain\ with\ Epik/i,
          :match_details => "Why\ purchase\ this\ domain\ with\ Epik",
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
  
