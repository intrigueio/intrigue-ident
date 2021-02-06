module Intrigue
  module Ident
    module Check
      module Private
        class Square < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "Square",
                :product => "Square",
                :website => "http://squareup.com/",
                :match_details => "Square Square - X-Square Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /X-Square:/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.sqclickstaging.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "Square",
                :product => "Square",
                :website => "http://squareup.com/",
                :match_details => "Square Square - X-Sq-Envoy-Safe-Auth-Decision Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /X-Sq-Envoy-Safe-Auth-Decision:/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://squaremktgstaging.com:80"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "Square",
                :product => "Square",
                :website => "http://squareup.com/",
                :match_details => "Square Square - _savt Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_savt=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.squareshowroom.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "Square",
                :product => "Square",
                :website => "http://squareup.com/",
                :match_details => "Square Square - _receipts Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_receipts=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://gosq.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "Square",
                :product => "Shuttle",
                :website => "https://github.com/square/shuttle",
                :match_details => "Square Shuttle - _shuttle_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_shuttle_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://shuttle.squareup.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
