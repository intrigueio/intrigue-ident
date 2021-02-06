module Intrigue
  module Ident
    module Check
      module Private
        class TrustYou < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "TrustYou",
                :product => "TrustYou Web Server",
                :website => "https://www.trustyou.com/",
                :match_details => "TrustYou TrustYou Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: TYwebserver/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^Server: TYwebserver (\d+(\.\d+)*)/i)
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
