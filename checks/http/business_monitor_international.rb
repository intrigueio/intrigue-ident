module Intrigue
  module Ident
    module Check
      module Private
        class BusinessMonitorInternational < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance", "Analytics"],
                :vendor => "Business Monitor International",
                :product => "Business Monitor International",
                :website => "http://www.businessmonitor.com/",
                :match_details => "Business Monitor International Business Monitor International - bmoadm_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /GRADLE_ENTERPRISE_IDENTITY=/i,
                :hide => false,
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
