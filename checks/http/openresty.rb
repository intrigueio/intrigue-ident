module Intrigue
  module Ident
    module Check
      class OpenResty < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["WebServer"],
              :vendor => "OpenResty",
              :product => "OpenResty",
              :match_details => "OpenResty - server header",
              :version => nil,
              :match_type => :content_headers,
              :match_content => /server: (?:ch-)?openresty/i,
              :dynamic_version => lambda { |x|
                version = _first_header_capture(x, /^server: (?:ch-)?openresty\/(\d+(\.\d+)*)/i)
              },
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => true,
            },
          ]
        end
      end
    end
  end
end
