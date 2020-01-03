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
        :product => "Sitecore CMS",
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
        :product => "Sitecore CMS",
        :match_details =>"powered by header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /x-powered-by:.*Sitecore CMS/,
        :paths => ["#{url}"],
        :inference => false
        }
    ]
  end
end
end
end
end
