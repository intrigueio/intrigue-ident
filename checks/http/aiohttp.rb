module Intrigue
  module Ident
    module Check
      module Private
        class AIOHTTP < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer", "ApplicationServer"],
                :vendor => "AIOHTTP",
                :product => "AIOHTTP Server",
                :website => "https://docs.aiohttp.org/en/stable/",
                :match_details => "AIOHTTP AIOHTTP Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: .*aiohttp/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^server: .*aiohttp\/(\d+(\.\d+)*)/i)
                },
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
            ]
          end
        end
      end
    end
  end
end
