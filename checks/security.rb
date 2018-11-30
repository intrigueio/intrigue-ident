module Intrigue
module Ident
module Check
class Security < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "configuration",
        :vendor => nil,
        :product => nil,
        :references => [],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^Access-Control-Allow-Origin:.*/i,
        :match_details => "Access-Control-Allow-Origin header exists",
        :hide => false,
        :paths => ["#{url}"]
      },
      {
        :type => "configuration",
        :vendor => nil,
        :product => nil,
        :references => [],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^p3p:.*/i,
        :match_details => "P3P header exists",
        :hide => false,
        :paths => ["#{url}"]
      },
      {
        :type => "configuration",
        :vendor => nil,
        :product => nil,
        :references => [],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^x-xss-protection:.*/i,
        :match_details => "XSS header exists",
        :hide => false,
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
