module Intrigue
  module Ident
  module Check
  class Symfony < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Symfony",
          :product => "Symfony",
          :match_details => "symfony cookie",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /symfony=/i,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  