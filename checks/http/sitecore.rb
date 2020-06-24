module Intrigue
module Ident
module Check
class Sitecore < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor => "Sitecore",
        :product => "CMS",
        :match_details => "Sitecore Analytics Cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /SC_ANALYTICS_GLOBAL_COOKIE=/i,
        :paths => ["#{url}"], 
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor => "Sitecore",
        :product => "CMS",
        :match_details =>"powered by header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /x-powered-by:.*Sitecore CMS/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor => "Sitecore",
        :product => "CMS",
        :match_details =>"powered by header",
        :version => nil,
        :match_type => :content_body,
        :match_content => /<major>/,
        :paths => ["#{url}/sitecore/shell/sitecore.version.xml"],
        :dynamic_version => lambda { |x|
          major = _body(x).scan(/<major>([\d]+)<\/major>/).first[0]
          minor = _body(x).scan(/<minor>([\d]+)<\/minor>/).first[0]
          build = _body(x).scan(/<build>([\d]+)<\/build>/).first[0]
          revision = _body(x).scan(/<revision>([\d]+)<\/revision>/).first[0]
        "#{major}.#{minor}.#{build}.#{revision}"  
        },
        :require_vendor_product => "Sitecore_CMS",
        :inference => true
      }
    ]
  end
end
end
end
end
