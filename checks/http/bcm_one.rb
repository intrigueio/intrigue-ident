module Intrigue
  module Ident
    module Check
      module Private
        class BCMOne < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "BCM One",
                :product => "nexVortex",
                :website => "https://www.nexvortex.com/",
                :match_details => "BCM One nexVortex - novo_sessionid Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /novo_sessionid=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "BCM One",
                :product => "nexVortex",
                :website => "https://www.nexvortex.com/",
                :match_details => "BCM One nexVortex - novo_vt Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /novo_vt=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://support.eschat.com:80"],
              },
            ]
          end
        end
      end
    end
  end
end
