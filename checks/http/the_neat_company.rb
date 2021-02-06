module Intrigue
  module Ident
    module Check
      module Private
        class TheNeatCompany < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social", "Management", "Cloud"],
                :vendor => "The Neat Company",
                :product => "The Neat Company",
                :website => "http://www.neat.com/",
                :match_details => "The Neat Company - _neatcloud_staging Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_neatcloud_staging=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social", "Management", "Cloud"],
                :vendor => "The Neat Company",
                :product => "The Neat Company",
                :website => "http://www.neat.com/",
                :match_details => "The Neat Company - _neatcloud_qa Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_neatcloud_qa=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social", "Management", "Cloud"],
                :vendor => "The Neat Company",
                :product => "The Neat Company",
                :website => "http://www.neat.com/",
                :match_details => "The Neat Company - _neat-verify_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_neat-verify_session=/,
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
