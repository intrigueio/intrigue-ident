module Intrigue
  module Ident
  module Check
  class Analytics < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
      [
        {
          :type => "content",
          :name =>"Google Analytics",
          :match_type => :content_body,
          :dynamic_result => lambda { |d|
            _first_body_capture(d, /gtag\(\'config\', \'(UA-\d+-\d+)/)
          },
          :paths => ["#{url}"]
        },
        {
          :type => "content",
          :name =>"Google Site Verification",
          :match_type => :content_body,
          :dynamic_result => lambda { |d|
            _first_body_capture(d, /<meta name=\"google-site-verification\" content=\"([\d\w\-]+)\" \/>/)
          },
          :paths => ["#{url}"]
        },
        {
          :type => "content",
          :name =>"MyWebStats",
          :match_type => :content_body,
          :dynamic_result => lambda { |d|
            _first_body_capture(d,/mywebstats_site_ids\.push\(([\d]+)\);/)
          },
          :paths => ["#{url}"]
        }
      ]
    end
  end
end
end
end