module Intrigue
  module Ident
    module Check
      class LiteSpeed < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "service",
              :tags => ["WebServer"],
              :vendor => "LiteSpeedTech",
              :product => "LiteSpeed Web Werver",
              :references => ["https://www.litespeedtech.com/products/litespeed-web-server"],
              :version => nil,
              :match_type => :content_headers,
              :match_content => /^server:\ LiteSpeed$/i,
              :dynamic_version => lambda { |x|
                _first_header_capture(x, /^server:\ LiteSpeed$/i)
              },
              :hide => false,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => true,
            },
          ]
        end
      end
    end
  end
end
