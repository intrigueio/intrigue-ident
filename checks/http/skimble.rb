module Intrigue
  module Ident
    module Check
      module Private
        class Skimble < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Health"],
                :vendor => "Skimble",
                :product => "Skimble",
                :website => "https://www.skimble.com/",
                :match_details => "Skimble Skimble - _skimble_sess Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_skimble_sess=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://asset3.skimble.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
