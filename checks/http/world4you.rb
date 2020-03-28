module Intrigue
  module Ident
  module Check
  class World4You < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parking"],
          :vendor => "World4You",
          :product => "World4You",
          :website => "https://www.world4you.com",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /Welcome to the high availability hosting network of World4You\!/i,
          :match_details => "unique body string",
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
  