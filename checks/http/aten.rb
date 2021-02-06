module Intrigue
  module Ident
    module Check
      module Private
        class Aten < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer", "Embedded"],
                :vendor => "Aten",
                :product => "Aten",
                :website => "https://www.aten.com/au/en/",
                :match_details => "Aten - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: ATEN HTTP Server/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: ATEN HTTP Server\(v(\d+(\.\d+)*)\)/i)
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
