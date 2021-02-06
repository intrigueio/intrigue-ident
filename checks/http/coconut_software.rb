module Intrigue
  module Ident
    module Check
      module Private
        class CoconutSoftware < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Coconut Software",
                :product => "Coconut Calendar",
                :website => "https://www.coconutsoftware.com/",
                :match_details => "Coconut Software Coconut Calendar - coconut_calendar Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /coconut_calendar=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://connexuscu.coconutcalendar.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
