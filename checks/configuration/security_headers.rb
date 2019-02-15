module Intrigue
module Ident
module Check
class SecurityHeaderConfiguration < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "configuration",
        :name => "Header Existence - Access-Control-Allow-Origin",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^Access-Control-Allow-Origin:.*/i;
        false
        },
        :paths => ["#{url}"],
        :hide => false
      },
      {
        :type => "configuration",
        :name => "Header Existence - P3P",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^p3p:.*/i;
        false
        },
        :paths => ["#{url}"],
        :hide => false
      },
      {
        :type => "configuration",
        :name => "Header Existence - X-Frame-Options",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^x-frame-options:.*/i;
        false
        },
        :paths => ["#{url}"],
        :hide => false
      },
      {
        :type => "configuration",
        :name => "Header Existence - X-XSS-Protection",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^x-xss-protection:.*/i;
        false
        },
        :paths => ["#{url}"],
        :hide => false
      }
    ]
  end
end
end
end
end
