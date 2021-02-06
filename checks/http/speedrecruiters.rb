module Intrigue
  module Ident
    module Check
      module Private
        class Speedrecruiters < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["PaaS", "HR"],
                :vendor => "Speedrecruiters",
                :product => "Speedrecruiters",
                :website => "https://www.speedrecruiters.com/",
                :match_details => "Speedrecruiters Speedrecruiters - _speedrecruiters_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_speedrecruiters_session=/i,
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
