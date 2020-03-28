  module Intrigue
  module Ident
  module Check
  class Instra < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Parking"],
          :vendor => "Instra",
          :product => "Instra",
          :website => "https://www.instra.com/",
          :references => [""],
          :version => nil,
          :match_type => :content_title,
          :match_content => /Domain\ parked\ by\ Instra/i,
          :match_details => "Domain\ parked\ by\ Instra",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Parking"],
          :vendor => "Instra",
          :product => "Instra",
          :website => "https://www.instra.com/",
          :references => ["https://www.europeregistry.com/about-us"],
          :version => nil,
          :match_type => :content_title,
          :match_content => /\-\ Domain\ parked\ by\ Europe\ Registry/i,
          :match_details => "\-\ Domain\ parked\ by\ Europe\ Registry",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Parking"],
          :vendor => "Instra",
          :product => "Instra",
          :website => "https://www.instra.com/",
          :references => ["https://www.asiaregistry.com/about-us"],
          :version => nil,
          :match_type => :content_title,
          :match_content => /\-\ Domain\ parked\ by\ Asia\ Registry/i,
          :match_details => "\-\ Domain\ parked\ by\ Asia\ Registry",
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
