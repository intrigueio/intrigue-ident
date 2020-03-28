  module Intrigue
  module Ident
  module Check
  class EasyName < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Parking"],
          :vendor => "EasyName",
          :product => "EasyName",
          :website => "https://www.easyname.com/",
          :references => [""],
          :version => nil,
          :match_type => :content_body,
          :match_content => /\<h1\>Domain\ geparkt\<\/h1\>/i,
          :match_details => "<h1>Domain geparkt</h1>",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Parking"],
          :vendor => "EasyName",
          :product => "EasyName",
          :website => "https://www.easyname.com/",
          :references => [""],
          :version => nil,
          :match_type => :content_title,
          :match_content => /easyname\ \|\ Domain geparkt/i,
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
