  module Intrigue
  module Ident
  module Check
  class AfriHost < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Parking"],
          :vendor => "AfriHost",
          :product => "AfriHost",
          :website => "https://www.afrihost.com/",
          :references => [""],
          :version => nil,
          :match_type => :content_title,
          :match_content => /Domain Parked/i,
          :match_details => "Domain Parked",
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
