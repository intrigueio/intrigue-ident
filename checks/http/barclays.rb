module Intrigue
  module Ident
    module Check
      module Private
        class Barclays < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance", "Management"],
                :vendor => "Barclays",
                :product => "Barclays",
                :website => "https://www.barclays.co.uk/",
                :match_details => "Barclays Barclays - bc_sessionId Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bc_sessionId=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://www.advancedbionutrition.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
