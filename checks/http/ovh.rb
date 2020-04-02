module Intrigue
  module Ident
  module Check
  class Ovh < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "OVH",
          :product => "OVH",
          :website => "https://www.ovh.it/hosting-web/faq/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /è stato registrato in ovh\.<\/p>/i,
          :match_details => "è stato registrato in ovh\.<\/p>",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "OVH",
          :product => "OVH",
          :website => "https://www.ovh.it/hosting-web/faq/",
          :references => [],
          :version => nil,
          :match_type => :content_title,
          :match_content => /Complimenti! Hai registrato il tuo dominio in OVH!/i,
          :match_details => "Complimenti! Hai registrato il tuo dominio in OVH!",
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
