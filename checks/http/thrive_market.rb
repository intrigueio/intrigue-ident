module Intrigue
  module Ident
    module Check
      module Private
        class ThriveMarket < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Thrive Market",
                :product => "Thrive Market",
                :website => "https://thrivemarket.com/",
                :match_details => "Thrive Market - segmentation_customer_group Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /segmentation_customer_group=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Thrive Market",
                :product => "Thrive Market",
                :website => "https://thrivemarket.com/",
                :match_details => "Thrive Market - thrv_opt_uuid Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /thrv_opt_uuid=/,
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
