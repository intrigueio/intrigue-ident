module Intrigue
  module Ident
  module Check
  class Sedo < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "Sedo",
          :product => "Sedo",
          :website => "https://sedo.com/us/park-domains/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /sedoParkingUrl:dto.sedoParkingUrl/i,
          :match_details => "parking string in body",
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
  