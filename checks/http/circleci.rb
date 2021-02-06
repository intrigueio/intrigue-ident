module Intrigue
  module Ident
    module Check
      module Private
        class CircleCI < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "CircleCI",
                :product => "CircleCI",
                :website => "https://circleci.com/",
                :match_details => "CircleCI - x-circleci-identity header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-circleci-identity:/i,
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
