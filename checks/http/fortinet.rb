module Intrigue
module Ident
module Check
  class Fortinet < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "operating_system",
          tags: ["VPN","Networking"],
          vendor: "Fortinet",
          product:"FortiOS",
          references: [
            "https://forum.fortinet.com/tm.aspx?m=130869"
          ],
          description:"FortiGate SSL VPN",
          match_type: :content_body,
          match_content:  /FortiToken clock drift detected/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
        },
        {
          type: "fingerprint",
          category: "operating_system",
          tags: ["VPN","Networking"],
          vendor: "Fortinet",
          product:"FortiOS",
          references: [],
          description:"FortiGate SSL VPN",
          match_type: :content_body,
          match_content:  /top\.location=window\.location;top\.location=\"\/remote\/login\"/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
        },
        {
          type: "fingerprint",
          category: "application",
          tags: ["VPN","Networking"],
          vendor: "Fortinet",
          product:"FortiGate SSL VPN",
          references: [],
          description:"unique string",
          match_type: :content_body,
          match_content:  /top\.location=window\.location;top\.location=\"\/remote\/login\"/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
        },
        {
          type: "fingerprint",
          category: "application",
          tags: ["VPN","Networking"],
          vendor: "Fortinet",
          product:"FortiGate SSL VPN",
          references: [],
          description:"clock drift detected string",
          match_type: :content_body,
          match_content:  /FortiToken clock drift detected/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
        }
      ]
    end

  end
end
end
end
