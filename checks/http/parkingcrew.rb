module Intrigue
  module Ident
  module Check
  class ParkingCrew < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "ParkingCrew",
          :product => "ParkingCrew",
          :website => "http://www.parkingcrew.net/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /inquire\ about\ this\ domain/i,
          :match_details => "inquire\ about\ this\ domain",
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
  
