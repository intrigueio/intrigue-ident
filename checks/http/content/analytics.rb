module Intrigue
  module Ident
  module Check
  class Analytics < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
      [
        {
          type: "content",
          name:"Google Analytics",
          dynamic_result: lambda { |d|
            _first_body_capture(d, /gtag\(\'config\', \'(UA-\d+-\d+)/)
          },
          paths: [ { path: "#{url}", follow_redirects: true } ],
        },
        {
          type: "content",
          name:"Google Site Verification",
          dynamic_result: lambda { |d|
            _first_body_capture(d, /<meta name=\"google-site-verification\" content=\"([\d\w\-]+)\" \/>/)
          },
          paths: [ { path: "#{url}", follow_redirects: true } ],
        },
        {
          type: "content",
          name:"MyWebStats",
          dynamic_result: lambda { |d|
            _first_body_capture(d,/mywebstats_site_ids\.push\(([\d]+)\);/)
          },
          paths: [ { path: "#{url}", follow_redirects: true } ],
        }
      ]
    end
  end
end
end
end