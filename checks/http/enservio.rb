module Intrigue
module Ident
module Check
class Enservio < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CMS"],
        :website => "https://www.enservio.com/about-us/about-enservio",
        :vendor => "Enservio",
        :product => "Enservio",
        :references => [],
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /_enservio_session=/i,
        :match_details => "cookie match",
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
