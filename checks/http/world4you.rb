module Intrigue
  module Ident
  module Check
  class World4You < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "World4You",
          :product => "World4You",
          :website => "https://www.world4you.com",
          :version => nil,
          :match_type => :content_body,
          :match_content => /This is a newly created customer website\<\/h1\>/i,
          :match_details => "unique body string",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        }, 
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "World4You",
          :product => "World4You",
          :website => "https://www.world4you.com",
          :version => nil,
          :match_type => :content_title,
          :match_content => /Hier entsteht eine neue Kunden-Website \| World4You\</i,
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
  