module Intrigue
  module Ident
  module Check
  class Godaddy < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parking"],
          :vendor => "Godaddy",
          :product => "Godaddy",
          :website => "https://www.godaddy.com",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /This Web page is parked for FREE, courtesy of.*GoDaddy.com/im,
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
  