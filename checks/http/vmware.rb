module Intrigue
module Ident
module Check
class Vmware < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Hypervisor"],
        :vendor => "VMWare",
        :product =>"ESXi",
        :match_details =>"unique page string",
        :version => nil,
        :match_type => :content_body,
        :match_content => /document.write\(\"<title>\"\ \+\ ID_EESX_Welcome/,
        :paths => ["#{url}"],
        :inference => false, 
        :issue => "exposed_admin_panel_unauthenticated"
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Hypervisor"],
        :vendor => "VMWare",
        :product =>"ESXi",
        :match_details =>"unique page string",
        :version => nil,
        :match_type => :content_body,
        :match_content => /client\/VMware-viclient\.exe/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Hypervisor"],
        :vendor => "VMWare",
        :product =>"Horizon View",
        :match_details =>"page title",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /<title>VMware Horizon/,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
