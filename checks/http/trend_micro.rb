module Intrigue
  module Ident
    module Check
      module Private
        class TrendMicro < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Trend Micro",
                :product => "Trend Micro Web Server",
                :website => "https://www.trendmicro.com/en_gb/business.html",
                :match_details => "Trend Micro Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Trend Micro$/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^server: Trend Micro (\d+(\.\d+)*)$/i)
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
