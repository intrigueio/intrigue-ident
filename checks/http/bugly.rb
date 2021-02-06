module Intrigue
  module Ident
    module Check
      module Private
        class Bugly < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "Bugly",
                :product => "Bugly",
                :website => "https://bugly.qq.com/",
                :match_details => "Bugly Bugly - bugly_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bugly_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://bugly.qq.com"],
              },
            ]
          end
        end
      end
    end
  end
end
