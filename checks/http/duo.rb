module Intrigue
  module Ident
  module Check
  class Duo < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["COTS", "Security", "IAM"],
          :vendor => "Duo",
          :product => "Access Gateway",
          :references => ["https://duo.com/docs/dag"],
          :version => nil,
          :match_type => :content_cookies,
          :match_content => /DUO_ACCESS_GATEWAY_AFFINITY/i,
          :match_details => "affinity cookie",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["COTS", "Security", "IAM"],
          :vendor => "Duo",
          :product => "Access Gateway",
          :references => ["https://duo.com/docs/dag"],
          :version => nil,
          :match_type => :content_title,
          :match_content => /^Duo Access Gateway$/i,
          :match_details => "title",
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
  