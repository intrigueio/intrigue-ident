module Intrigue
  module Ident
  module Check
  class Zoho < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Support"],
          :vendor =>"Zoho",
          :product =>"ManageEngine Desktop",
          :match_details =>"title",
          :references => [],
          :match_type => :content_title,
          :match_content =>  /ManageEngine Desktop Central/i,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Support"],
          :vendor =>"Zoho",
          :product =>"ManageEngine ServiceDesk",
          :match_details =>"title",
          :references => [],
          :match_type => :content_title,
          :match_content =>  /ManageEngine ServiceDesk/i,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Support"],
          :vendor =>"Zoho",
          :product =>"ManageEngine AssetExplorer",
          :match_details =>"title",
          :references => [],
          :match_type => :content_title,
          :match_content =>  /ManageEngine AssetExplorer/i,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  