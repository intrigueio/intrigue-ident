module Intrigue
module Ident
module Check
  class Fortinet < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["VPN","Networking"],
          :vendor => "Fortinet",
          :product =>"FortiGate",
          :references => [
            "https://forum.fortinet.com/tm.aspx?m=130869"
          ],
          :match_details =>"server header",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /FortiToken clock drift detected/i,
          :paths => ["#{url}"]
        }
      ]
    end

  end
end
end
end
