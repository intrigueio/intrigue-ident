module Intrigue
  module Ident
    module Check
      module Private
        class Sawmill < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "Sawmill",
                :product => "Sawmill",
                :website => "https://www.sawmill.net/index.html",
                :match_details => "Sawmill - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Sawmill/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Sawmill\/(\d+(\.\d+)*)/i)
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
