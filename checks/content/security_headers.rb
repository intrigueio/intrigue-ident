module Intrigue
module Ident
module Check
class SecurityHeaders < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "content",
        :name => "Access-Control-Allow-Origin Header",
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^Access-Control-Allow-Origin:.*/i;
        false
        },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      },
      {
        :type => "content",
        :name => "P3P Header",
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^p3p:.*/i;
        false
        },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      },
      {
        :type => "content",
        :name => "X-Frame-Options Header",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^x-frame-options:.*/i;
        false
        },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      },
      {
        :type => "content",
        :name => "X-XSS-Protection Header",
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^x-xss-protection:.*/i;
        false
        },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
