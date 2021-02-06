module Intrigue
  module Ident
    module Check
      module Private
        class ActiveDEMAND < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Marketing", "Analytics"],
                :vendor => "ActiveDEMAND",
                :product => "ActiveDEMAND",
                :website => "https://www.activedemand.com/",
                :match_details => "ActiveDEMAND ActiveDEMAND - _ad_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_ad_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://52.86.61.6/"],
              },
            ]
          end
        end
      end
    end
  end
end
