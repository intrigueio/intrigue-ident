module Intrigue
  module Ident
    module Check
      module Private
        class Dissolve < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Marketing"],
                :vendor => "Dissolve",
                :product => "Dissolve",
                :website => "https://dissolve.com/",
                :match_details => "Dissolve Dissolve - _dissolve_session_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_dissolve_session_id=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Marketing"],
                :vendor => "Dissolve",
                :product => "Dissolve",
                :website => "https://dissolve.com/",
                :match_details => "Dissolve Dissolve - guest_token Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /guest_token=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Marketing"],
                :vendor => "Dissolve",
                :product => "Dissolve",
                :website => "https://dissolve.com/",
                :match_details => "Dissolve Dissolve - _contributors_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_contributors_session=/,
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
