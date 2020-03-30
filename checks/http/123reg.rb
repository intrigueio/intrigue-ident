module Intrigue
  module Ident
  module Check
  class OneTwoThreeReg < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "123Reg",
          :product => "123Reg",
          :website => "https://www.123-reg.co.uk/",
          :references => [],
          :version => nil,
          :match_type => :content_title,
          :match_content => /Want your own website\? \| 123 Reg/i,
          :match_details => "Want your own website\? \| 123 Reg",
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
  
