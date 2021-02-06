module Intrigue
  module Ident
    module Check
      module Private
        class Therapydia < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Health"],
                :vendor => "Therapydia",
                :product => "Therapydia",
                :website => "https://www.therapydia.com/",
                :match_details => "Therapydia - _staging_thera_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_staging_thera_session=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Health"],
                :vendor => "Therapydia",
                :product => "Therapydia",
                :website => "https://www.therapydia.com/",
                :match_details => "Therapydia - _thera_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_thera_session=/,
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
