module Intrigue
  module Ident
  module Check
  class Namesilo < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "Namesilo",
          :product => "NameSilo",
          :website => "https://www.namesilo.com/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /This domain is parked free of charge with NameSilo.com/i,
          :match_details => "string in body",
          :hide => false,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  