module Intrigue
  module Ident
  module Check
  class DAN < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "DAN.com",
          :product => "DAN.com",
          :website => "https://dan.com/",
          :references => [],
          :version => nil,
          :match_type => :content_title,
          :match_content => /There are millions of other domains available on DAN\.COM\. You can probably find the one that fits you best!/i,
          :match_details => "There are millions of other domains available on DAN\.COM\. You can probably find the one that fits you best!",
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
