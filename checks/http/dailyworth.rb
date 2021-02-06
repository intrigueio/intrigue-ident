module Intrigue
  module Ident
    module Check
      module Private
        class DailyWorth < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "DailyWorth",
                :product => "DailyWorth",
                :website => "http://www.dailyworth.com/",
                :match_details => "DailyWorth DailyWorth - _DailyWorth_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_DailyWorth_session=/i,
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
