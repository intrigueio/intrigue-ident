module Intrigue
  module Ident
    module Check
      module Private
        class Starbucks < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hospitality"],
                :vendor => "Starbucks",
                :product => "Starbucks",
                :website => "http://www.starbucks.com/",
                :match_details => "Starbucks - sbj_ols_cart_token_production Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /sbj_ols_cart_token_production=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hospitality"],
                :vendor => "Starbucks",
                :product => "Starbucks",
                :website => "http://www.starbucks.com/",
                :match_details => "Starbucks - sbj_ols_cart_token_expire_production Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /sbj_ols_cart_token_expire_production=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hospitality"],
                :vendor => "Starbucks",
                :product => "Starbucks",
                :website => "http://www.starbucks.com/",
                :match_details => "Starbucks - sbj_ols_cart_count_production Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /sbj_ols_cart_count_production=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hospitality"],
                :vendor => "Starbucks",
                :product => "Starbucks",
                :website => "http://www.starbucks.com/",
                :match_details => "Starbucks - BARISTASESSIONID Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /BARISTASESSIONID=/,
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
