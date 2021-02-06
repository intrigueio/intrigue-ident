module Intrigue
  module Ident
    module Check
      module Private
        class Brovotech < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer", "Embedded"],
                :vendor => "Brovotech",
                :product => "Brovotech",
                :website => "https://www.brovotech.com/",
                :match_details => "Brovotech - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Brovotech/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Brovotech\/(\d+(\.\d+)*)/i)
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
