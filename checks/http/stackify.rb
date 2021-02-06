module Intrigue
  module Ident
    module Check
      module Private
        class Stackify < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Cloud", "SaaS", "Development"],
                :vendor => "Stackify",
                :product => "Stackify",
                :website => "http://stackify.com/",
                :match_details => "Stackify Stackify - x-stackifyid Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-stackifyid:/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://20.45.1.44:80"],
              },
            ]
          end
        end
      end
    end
  end
end
