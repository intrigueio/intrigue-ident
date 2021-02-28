module Intrigue
module Ident
module Check
class SecurityHeaders < Intrigue::Ident::Check::Base
  
  def generate_checks(url)
    [
      {
        type: "content",
        name: "Access-Control-Allow-Origin Header",
        dynamic_result: lambda { |d|
          return true if _first_header_match d, /^Access-Control-Allow-Origin:.*/i;
        false
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
      },
      {
        type: "content",
        name: "P3P Header",
        dynamic_result: lambda { |d|
          return true if _first_header_match d, /^p3p:.*/i;
        false
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
      },
      {
        type: "content",
        name: "X-Frame-Options Header",
        dynamic_result: lambda { |d|
          return true if _first_header_match d, /^x-frame-options:.*/i;
        false
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
      },
      {
        type: "content",
        name: "X-XSS-Protection Header",
        dynamic_result: lambda { |d|
          return true if _first_header_match d, /^x-xss-protection:.*/i;
        false
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
      }
    ]
  end
end
end
end
end
