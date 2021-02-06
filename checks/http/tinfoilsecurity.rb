module Intrigue
  module Ident
    module Check
      module Private
        class TinfoilSecurity < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "TinfoilSecurity",
                :product => "TinfoilSecurity",
                :website => "https://www.tinfoilsecurity.com/",
                :match_details => "TinfoilSecurity TinfoilSecurity - _tinfoil_app_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_tinfoil_app_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
