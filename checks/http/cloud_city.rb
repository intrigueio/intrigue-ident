module Intrigue
  module Ident
  module Check
  class CloudCity < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "Cloud City",
          :product => "Cloud City",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /This domain name is registered and parked<br>with Cloud City/i,
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
  