module Intrigue
  module Ident
    module Check
      module Private
        class DoorDash < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["SaaS", "Organization"],
                :vendor => "DoorDash",
                :product => "Caviar",
                :website => "https://www.trycaviar.com/",
                :match_details => "DoorDash Caviar - _caviar_teams_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_caviar_teams_session=/i,
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
