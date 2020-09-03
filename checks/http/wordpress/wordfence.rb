module Intrigue
  module Ident
  module Check
  class Wordfence < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Wordpress Plugin", "Social"],
          :vendor =>"Wordfence",
          :product =>"Wordfence",
          :match_details =>"plugin",
          :references => [],
          :match_type => :content_body,
          :match_content =>  /wordfence_lh=/i,
          :paths => ["#{url}"],
          :require_product => "Wordpress",
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Wordpress Plugin", "Social"],
          :vendor =>"Wordfence",
          :product =>"Wordfence",
          :match_details =>"plugin",
          :references => [],
          :match_type => :content_body,
          :match_content =>  /wordfence_syncAttackData[\?\"\=]/i,
          :paths => ["#{url}"],
          :require_product => "Wordpress",
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  