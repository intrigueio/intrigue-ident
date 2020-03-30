module Intrigue
  module Ident
  module Check
  class FirstDomains < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "1st Domains",
          :product => "1st Domains",
          :website => "https://1stdomains.nz/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /This domain is currently parked with 1st Domains and does not yet have a website/i,
          :match_details => "domain is parked",
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
  