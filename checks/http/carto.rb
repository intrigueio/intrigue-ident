module Intrigue
  module Ident
    module Check
      module Private
        class Carto < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Database"],
                :vendor => "Carto",
                :product => "CartoDB",
                :website => "https://carto.com/",
                :match_details => "Carto CartoDB - _cartodb_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_cartodb_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
                :test_target => ["https://3.14.59.132:443"],
              },
            ]
          end
        end
      end
    end
  end
end
