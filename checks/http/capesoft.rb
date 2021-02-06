module Intrigue
  module Ident
    module Check
      module Private
        class CapeSoft < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "CapeSoft",
                :product => "NetTalk WebServer",
                :website => "https://www.capesoft.com/docs/nettalk/nettalkwebbasic.htm",
                :match_details => "CapeSoft NetTalk WebServer - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: NetTalk-WebServer/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: NetTalk-WebServer\/(\d+(\.\d+)*)/i)
                },
                :hide => false,
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
