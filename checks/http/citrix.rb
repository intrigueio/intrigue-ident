module Intrigue
module Ident
module Check
class Citrix < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Networking","COTS", "VPN"],
        :vendor => "Citrix",
        :product => "NetScaler Gateway",
        :match_details => "title",
        :version => nil,
        :match_type => :content_title,
        :match_content => /NetScaler Gateway/i,
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Networking","COTS", "VPN"],
        :vendor => "Citrix",
        :product => "NetScaler Gateway",
        :match_details => "(often) customized logon page - netscaler gateway",
        :version => nil,
        :match_type => :content_body,
        :match_content => /CTXMSAM_LogonFont/i,
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Networking","COTS", "VPN"],
        :vendor => "Citrix",
        :product => "NetScaler Gateway",
        :match_details => "misspelled content-length header",
        :references => ["https://support.citrix.com/article/CTX211605"],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^cteonnt-length:.*$/i,
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Networking","COTS", "VPN"],
        :vendor => "Citrix",
        :product => "NetScaler Gateway",
        :match_details => "cookie",
        :references => ["https://support.citrix.com/article/CTX131488"],
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /citrix_ns_id=/i,
        :hide => false,
        :paths => ["#{url}"],
        :verify => ["dW5kZXJhcm1vdXIjSW50cmlndWU6OkVudGl0eTo6VXJpI2h0dHA6Ly8yMDQuMjkuMTk2LjEwMjo4MA=="],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Networking", "COTS", "VPN"],
        :vendor => "Citrix",
        :product => "NetScaler Gateway",
        :match_details => "redirect",
        :references => ["https://support.citrix.com/article/CTX131488"],
        :match_type => :content_headers,
        :match_content => /^location: \/vpn\/index\.html$/i ,
        :hide => false,
        :paths => ["#{url}/doesntexist-123"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Networking", "COTS", "VPN"],
        :vendor => "Citrix",
        :product => "NetScaler Gateway",
        :match_details => "cookie",
        :references => [],
        :match_type => :content_cookies,
        :match_content => /NSC_TASS=\/doesntexist-123\/vpn\/index\.html/i ,
        :hide => false,
        :paths => ["#{url}/doesntexist-123"],
        :inference => false
      },  
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Networking","COTS", "Hypervisor"],
        :vendor => "Citrix",
        :product => "XenServer",
        :match_details => "page title",
        :references => [],
        :version => nil,
        :dynamic_version => lambda { |x| 
          _first_body_capture(x,/<title>XenServer (.*?)<\/title>/) 
        },
        :match_type => :content_body,
        :match_content => /<title>XenServer/,
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :vendor => "Citrix",
        :tags => ["Networking","COTS", "Hypervisor"],
        :product => "XenServer",
        :match_details => "page title",
        :references => [],
        :version => nil,
        :dynamic_version => lambda { |x|
          _first_body_capture(x,/<title>Welcome to Citrix XenServer (.*?)<\/title>/)
        },
        :match_type => :content_body,
        :match_content => /<title>Welcome to Citrix XenServer/,
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
