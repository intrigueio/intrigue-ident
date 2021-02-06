module Intrigue
  module Ident
    module Check
      module Private
        class BalanceOfNature < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Balance Of Nature",
                :product => "Balance Of Nature",
                :website => "https://www.balanceofnature.com/",
                :match_details => "Balance Of Nature Balance Of Nature - bon_history Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bon_history=/,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.balanceofnature.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Balance Of Nature",
                :product => "Balance Of Nature",
                :website => "https://www.balanceofnature.com/",
                :match_details => "Balance Of Nature Balance Of Nature - bon_step Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bon_step=/,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.balanceofnature.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Balance Of Nature",
                :product => "Balance Of Nature",
                :website => "https://www.balanceofnature.com/",
                :match_details => "Balance Of Nature Balance Of Nature - bon_strategy Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bon_strategy=/,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.balanceofnature.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
