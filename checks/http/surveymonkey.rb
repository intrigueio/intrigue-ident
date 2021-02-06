module Intrigue
  module Ident
    module Check
      module Private
        class SurveyMonkey < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Analytics", "Marketing"],
                :vendor => "SurveyMonkey",
                :product => "SurveyMonkey",
                :website => "http://www.surveymonkey.com/",
                :match_details => "SurveyMonkey SurveyMonkey - sm_rec Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /sm_rec=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Analytics", "Marketing"],
                :vendor => "SurveyMonkey",
                :product => "SurveyMonkey",
                :website => "http://www.surveymonkey.com/",
                :match_details => "SurveyMonkey SurveyMonkey - apex__sm Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /apex__sm=/,
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
