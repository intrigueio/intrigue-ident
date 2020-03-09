
module Intrigue
  module Ident
  module Check
  class Splash < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Marketing", "Javascript", "SaaS"],
          :vendor =>"Splash",
          :product =>"Splash",
          :match_details =>"title for default landing page",
          :version => nil,
          :match_type => :content_title,
          :match_content =>  /Event Marketing Software - Splash/i,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  