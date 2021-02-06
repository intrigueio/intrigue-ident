module Intrigue
  module Ident
    module Check
      module Private
        class AirTies < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Airties",
                :product => "Airties",
                :website => "https://airties.com/",
                :match_details => "Airties - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Airties/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: AirTies\/ASP (\d+(\.\d+)*)/i)
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
