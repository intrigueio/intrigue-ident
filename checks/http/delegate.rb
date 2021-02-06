module Intrigue
  module Ident
    module Check
      module Private
        class DeleGate < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Proxy Server"],
                :vendor => "DeleGate",
                :product => "DeleGate",
                :website => "http://www.delegate.org/",
                :match_details => "DeleGate - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: DeleGate/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: DeleGate\/(\d+(\.\d+)*)/i)
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
