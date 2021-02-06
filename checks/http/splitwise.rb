module Intrigue
  module Ident
    module Check
      module Private
        class SplitWise < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance", "Management"],
                :vendor => "SplitWise",
                :product => "SplitWise",
                :website => "https://www.splitwise.com/",
                :match_details => "SplitWise SplitWise  - _splitwise_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_splitwise_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance", "Management"],
                :vendor => "SplitWise",
                :product => "SplitWise",
                :website => "https://www.splitwise.com/",
                :match_details => "SplitWise SplitWise  - swdid Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /swdid=/i,
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
