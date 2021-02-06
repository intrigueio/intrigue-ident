module Intrigue
  module Ident
    module Check
      module Private
        class Sony < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Entertainment"],
                :vendor => "Sony",
                :product => "Sony Pictures Museum",
                :website => "https://www.sonypicturesmuseum.com/",
                :match_details => "Sony Sony Pictures Museum - laravel_session_sony Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /laravel_session_sony=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.sonypicturesmuseum.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
