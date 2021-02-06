module Intrigue
  module Ident
    module Check
      module Private
        class SunbirdDCIM < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Database"],
                :vendor => "Sunbird DCIM",
                :product => "GI NetWorks dcTrack Cloud based Database",
                :website => "https://www.sunbirddcim.com/",
                :match_details => "Sunbird GI NetWorks dcTrack Cloud based Database - _dctrack_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_dctrack_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://93.191.155.22/login/login"],
              },
            ]
          end
        end
      end
    end
  end
end
