module Intrigue
  module Ident
    module Check
      module Private
        class Teldat < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer", "Embedded"],
                :vendor => "Teldat",
                :product => "Teldat",
                :website => "https://www.teldat.com/teldat-home/",
                :match_details => "Teldat - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Teldat/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Teldat\/(\d+(\.\d+)*)/i)
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
end
