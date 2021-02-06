module Intrigue
  module Ident
    module Check
      module Private
        class TheAtlantic < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Media"],
                :vendor => "The Atlantic",
                :product => "The Atlantic",
                :website => "https://www.theatlantic.com/",
                :match_details => "The Atlantic The Atlantic  - atl_uuid Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /atl_uuid=/i,
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
