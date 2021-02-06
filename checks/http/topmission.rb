module Intrigue
  module Ident
    module Check
      module Private
        class TopMission < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Frontend"],
                :vendor => "TopMission",
                :product => "TopMission",
                :website => "http://topmission.ru/",
                :match_details => "TopMission - _topmission-landing_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_topmission-landing_session=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Frontend"],
                :vendor => "TopMission",
                :product => "TopMission",
                :website => "http://topmission.ru/",
                :match_details => "TopMission - _topmission_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_topmission_session=/,
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
