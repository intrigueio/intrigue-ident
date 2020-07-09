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

          majorx = _body(x).scan(/<major>([\d]+)<\/major>/).first
          major = majorx[0] if majorx

          minorx = _body(x).scan(/<minor>([\d]+)<\/minor>/).first
          minor = minorx[0] if minorx 

          revisionx = _body(x).scan(/<revision>([\d]+)<\/revision>/).first
          revision = revisionx[0] if revisionx

          buildx = _body(x).scan(/<build>([\d]+)<\/build>/).first
          build = buildx[0] if buildx

          out = "#{major}.#{minor}.#{revision}"  
          out << ".#{build}" if build
          
        out
        },
        :require_vendor_product => "sitecore_cms",
        :inference => true
      }
    ]
  end
end
end
end
end
