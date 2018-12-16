module Intrigue
module Ident
module Check
class Security < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "configuration",
        :name =>"Form Detected",
        :match_type => :content_body,
        :dynamic_result => lambda { |d|
          return true if d["details"]["hidden_response_data"] =~ /\<form.*$/;
        false
        },
        :hide => true,
        :paths => ["#{url}"],
      },
      {
        :type => "configuration",
        :name =>"HTTP Authentication Detected",
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if d["details"]["headers"].join("\n") =~ /^www-authenticate:.*$/;
        false
        },
        :hide => true,
        :paths => ["#{url}"],
      },
      {
        :type => "configuration",
        :name =>"Form Authentication Detected",
        :references => [
          "https://webstersprodigy.net/2010/04/07/nmap-script-to-try-and-detect-login-pages/",
          "https://nmap.org/nsedoc/scripts/http-auth-finder.html"
        ],
        :match_type => :content_body,
        :dynamic_result => lambda { |d|
          body = d["details"]["hidden_response_data"]
          return true if body =~ /<input type=\"password\"/im;
          return true if body =~ /<script>[^>]*login/im;
          return true if body =~ /<[^>]*login/im;
          return true if body =~ /<script>[^>]*password/im;
          return true if body =~ /<script>[^>]*user/im;
          return true if body =~ /<input[^>)]*user/im;
          return true if body =~ /<input[^>)]*pass/im;
          return true if body =~ /<input[^>)]*pwd/im;
        false
        },
        :hide => true,
        :paths => ["#{url}"],
      },
      {
        :type => "configuration",
        :name => "Access-Control-Allow-Origin Header Exists",
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
