module Intrigue
module Ident
module Check
class Binarysec < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WAF"],
        :url => "",
        :references => [
          "https://github.com/EnableSecurity/wafw00f"
        ],
        :vendor => "BinarySEC",
        :product =>"Web Application Firewall",
        :match_details =>"cookie",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: BinarySec/i,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WAF"],
        :url => "",
        :references => [
          "https://github.com/EnableSecurity/wafw00f"
        ],
        :vendor => "BinarySEC",
        :product =>"Web Application Firewall",
        :match_details =>"cookie",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /x-binarysec/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
