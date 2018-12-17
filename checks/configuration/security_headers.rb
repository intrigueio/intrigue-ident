module Intrigue
module Ident
module Check
class SecurityHeaderConfiguration < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "configuration",
        :name => "Access-Control-Allow-Origin Header Exists",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if d["details"]["headers"].join("\n") =~ /^Access-Control-Allow-Origin:.*/i;
        false
        },
        :paths => ["#{url}"]
      },
      {
        :type => "configuration",
        :name => "P3P Header Exists",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if d["details"]["headers"].join("\n") =~ /^p3p:.*/i;
        false
        },
        :paths => ["#{url}"]
      },
      {
        :type => "configuration",
        :name => "X-Frame-Options Header Exists",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if d["details"]["headers"].join("\n") =~ /^x-frame-options:.*/i;
        false
        },
        :paths => ["#{url}"]
      },
      {
        :type => "configuration",
        :name => "X-XSS-Protection Header Exists",
        :tags => ["SecurityHeadersConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if d["details"]["headers"].join("\n") =~ /^x-xss-protection:.*/i;
        false
        },
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
