module Intrigue
  module Ident
    module Check
      module Private
        class AbmWeb < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Application Server"],
                :vendor => "AbmWeb",
                :product => "AbmWeb",
                :website => "https://abmwebsol.com/",
                :match_details => "AbmWeb - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: AbmWeb/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: AbmWeb\/(\d+(\.\d+)*)/i)
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
