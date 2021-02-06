module Intrigue
  module Ident
    module Check
      module Private
        class Skuuper < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Skuuper",
                :product => "Skuuper",
                :website => "https://skuuper.com/",
                :match_details => "Skuuper - _skuuper_web cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_skuuper_web=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://skuuper.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
