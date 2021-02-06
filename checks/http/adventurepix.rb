module Intrigue
  module Ident
    module Check
      module Private
        class AdventurePix < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "AdventurePix",
                :product => "AdventurePix",
                :website => "https://adventurepix.com/",
                :match_details => "AdventurePix AdventurePix - photography_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /photography_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://adventurepix.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
