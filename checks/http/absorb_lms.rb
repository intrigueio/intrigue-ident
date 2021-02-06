module Intrigue
  module Ident
    module Check
      module Private
        class AbsorbLMS < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Absorb LMS",
                :product => "Absorb LMS",
                :website => "https://www.absorblms.com/",
                :match_details => "Absorb LMS - _absorb_ui_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_absorb_ui_session=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Absorb LMS",
                :product => "Absorb LMS",
                :website => "https://www.absorblms.com/",
                :match_details => "Absorb LMS - X-Absorb-Correlation-Id Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /X-Absorb-Correlation-Id:/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Absorb LMS",
                :product => "eLogic Learning eSSential LMS Web Server",
                :website => "https://elogiclearning.com/",
                :match_details => "Absorb LMS eLogic Learning eSSential LMS Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Elogic_Essential/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Absorb LMS",
                :product => "Absorb LMS",
                :website => "https://www.absorblms.com/",
                :match_details => "Absorb LMS - X-LMS-Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /X-LMS-Server:/,
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
