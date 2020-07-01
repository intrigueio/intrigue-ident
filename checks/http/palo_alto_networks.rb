module Intrigue
module Ident
module Check
class PaloAltoNetworks < Intrigue::Ident::Check::Base

  def generate_checks(uri)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Networking", "VPN", "Firewall"],
        :vendor => "PaloAltoNetworks",
        :product =>"GlobalProtect",
        :match_details =>"GlobalProtect Portal",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /global-protect\/login.esp/i,
        :paths => ["#{uri}"],
        :inference => false,
        :tasks => [
          "vuln/paloalto_globalprotect_check", 
          "vuln/paloalto_globalprotect_check_cve202020201"
        ]
      }
    ]
  end

end
end
end
end
