module Intrigue
  module Ident
    module Check
      module Private
        class Advantage < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Hosting"],
                :vendor => "Advantage",
                :product => "Aqua",
                :website => "https://www.gotoadvantage.com/aqua",
                :match_details => "Advantage Aqua - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<title>Advantage Aqua/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<title>Advantage Aqua v(\d+(\.\d+)*)/i)
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
