module Intrigue
  module Ident
  module Check
  class Dreamhost < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parking"],
          :vendor => "Dreamhost",
          :product => "Dreamhost",
          :website => "https://www.dreamhost.com",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /This site is parked with DreamHost/i,
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
  