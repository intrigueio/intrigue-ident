module Intrigue
  module Ident
    module Check
      module Private
        class StarAlliance < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Travel"],
                :vendor => "Star Alliance",
                :product => "Star Alliance Points Universe",
                :website => "http://www.staralliance.com/en/",
                :match_details => "Star Alliance Star Alliance Points Universe - point_universe_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /point_universe_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://points.flysas.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
