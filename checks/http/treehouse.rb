module Intrigue
  module Ident
    module Check
      module Private
        class Treehouse < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development", "Education"],
                :vendor => "Treehouse",
                :product => "Treehouse",
                :website => "http://teamtreehouse.com/",
                :match_details => "Treehouse Treehouse - _treehouse_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_treehouse_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://18.211.40.93/"],
              },
            ]
          end
        end
      end
    end
  end
end
