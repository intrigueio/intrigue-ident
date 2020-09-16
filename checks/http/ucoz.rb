module Intrigue
  module Ident
  module Check
  class Ucoz < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting"],
          :vendor => "uCoz",
          :product => "uCoz",
          :website => "https://www.ucoz.com/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /title\=\"Hosted by uCoz\"/i,
          :match_details => "title\=\"Hosted by uCoz\"",
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
  
