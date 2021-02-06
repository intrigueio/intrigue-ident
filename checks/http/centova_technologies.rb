module Intrigue
  module Ident
    module Check
      module Private
        class CentovaTechnologies < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Centova Technologies",
                :product => "Centova Cast",
                :website => "https://centova.com/en/cast",
                :match_details => "Centova Technologies Centova Cast - centovacast Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /centovacast=/i,
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
