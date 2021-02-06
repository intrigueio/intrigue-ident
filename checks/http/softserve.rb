module Intrigue
  module Ident
    module Check
      module Private
        class SoftServe < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "SoftServe",
                :product => "StoryTeller",
                :website => "https://softserve.softservestoryteller.com/privacy-policy",
                :match_details => "SoftServe StoryTeller - _storyteller_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_storyteller_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.softservestoryteller.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
