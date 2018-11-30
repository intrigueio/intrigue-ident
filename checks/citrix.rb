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
            :product => "Netscaler Gateway Firmware",
            :match_details => "Citrix Netscaler Gateway",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<title>Netscaler Gateway/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["Networking","COTS", "VPN"],
            :vendor => "Citrix",
            :product => "Netscaler Gateway Firmware",
            :match_details => "(often) customized logon page - netscaler gateway",
            :version => nil,
            :match_type => :content_body,
            :match_content => /CTXMSAM_LogonFont/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["Networking","COTS", "VPN"],
            :vendor => "Citrix",
            :product => "Netscaler Gateway Firmware",
            :match_details => "misspelled content-length header",
            :references => ["https://support.citrix.com/article/CTX211605"],
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^cteonnt-length:.*$/,
            :hide => false,
            :paths => ["#{url}"],
          },
          {
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["Networking","COTS", "VPN"],
            :vendor => "Citrix",
            :product => "Netscaler Gateway Firmware",
            :match_details => "cookie",
            :references => ["https://support.citrix.com/article/CTX131488"],
            :version => nil,
            :match_type => :content_cookies,
            :match_content => /citrix_ns_id=/,
            :hide => false,
            :paths => ["#{url}"],
            :verify => ["dW5kZXJhcm1vdXIjSW50cmlndWU6OkVudGl0eTo6VXJpI2h0dHA6Ly8yMDQuMjkuMTk2LjEwMjo4MA=="],
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Networking","COTS", "Hypervisor"],
            :vendor => "Citrix",
            :product => "XenServer",
            :match_details => "page title",
            :references => [""],
            :version => nil,
            :dynamic_version => lambda { |x| _first_body_capture(x,/<title>XenServer (.*?)<\/title>/) },
            :match_type => :content_body,
            :match_content => /<title>XenServer/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :vendor => "Citrix",
            :tags => ["Networking","COTS", "Hypervisor"],
            :product => "XenServer",
            :match_details => "page title",
            :references => [""],
            :version => nil,
            :dynamic_version => lambda { |x| _first_body_capture(x,/<title>Welcome to Citrix XenServer (.*?)<\/title>/) },
            :match_type => :content_body,
            :match_content => /<title>Welcome to Citrix XenServer/,
            :hide => false,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
