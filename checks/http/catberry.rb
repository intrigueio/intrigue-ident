module Intrigue
  module Ident
    module Check
      module Private
        class Catberry < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Catberry",
                :product => "Catberry",
                :website => "https://catberry.github.io/",
                :match_details => "Catberry - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Catberry/i,
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
