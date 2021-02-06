module Intrigue
  module Ident
    module Check
      module Private
        class Agranat < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer", "Embedded"],
                :vendor => "Agranat-EmWeb",
                :product => "Agranat-EmWeb",
                :references => ["https://www.freepatentsonline.com/5973696.html"],
                :match_details => "Agranat-EmWeb - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Agranat-EmWeb/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Agranat-EmWeb\/R(\d+(\_\d+)*)/i)
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
