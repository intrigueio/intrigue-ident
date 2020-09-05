module Intrigue
module Ident
module Check
class Incapsula < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor =>"Incapsula",
        :product =>"CDN",
        :match_details =>"incapsula header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-iinfo:\ .*$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor =>"Incapsula",
        :product =>"CDN",
        :match_details =>"incapsula header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-cdn: Incapsula$/i,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor =>"Incapsula",
        :product =>"CDN",
        :match_details =>"incapsula header (miss)",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /Request unsuccessful. Incapsula incident ID/i,
        :paths => ["#{url}"],
        :inference => false,
        :hide => true 
      } , 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor =>"Incapsula",
        :product =>"CDN",
        :match_details =>"incapsula cookie (visid_incap_...)",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /visid_incap_[\d\_]+=/i,
        :paths => ["#{url}"],
        :inference => false,
        :hide => true 
      }
    ]
  end

end
end
end
end
