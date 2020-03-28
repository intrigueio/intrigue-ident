  module Intrigue
  module Ident
  module Check
  class Nexicom < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "Nexicom",
          :product => "Nexicom",
          :website => "https://nexicom.net/",
          :version => nil,
          :match_type => :content_body,
          :match_content => /\<STRONG\>What\ is\ Domain\ Parking\?\<\/STRONG\>/i,
          :match_details => "<STRONG>What is Domain Parking?</STRONG>",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "Nexicom",
          :product => "Nexicom",
          :website => "https://nexicom.net/",
          :version => nil,
          :match_type => :content_title,
          :match_content => /Park\ your\ Domain\ \@\ Nexicom/i,
          :match_details => "Park\ your\ Domain\ \@\ Nexicom",
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
