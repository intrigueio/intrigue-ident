module Intrigue
  module Ident
    module Check
      module Private
        class Coturn < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["VOIP"],
                :vendor => "Coturn Project",
                :product => "Coturn",
                :website => "https://github.com/coturn/coturn",
                :match_details => "Coturn - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Coturn/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Coturn-(\d+(\.\d+)*)/i)
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
