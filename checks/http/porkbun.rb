module Intrigue
  module Ident
  module Check
  class Porkbun < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "Porkbun",
          :product => "Porkbun",
          :website => "ttps://porkbun.com/h",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /but the owner has not put up a site yet. Visit again soon to see what amazing website they decide to build./i,
          :match_details => "unique body string",
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
  