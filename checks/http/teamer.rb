module Intrigue
  module Ident
    module Check
      module Private
        class Teamer < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "Teamer",
                :product => "Teamer",
                :website => "http://www.teamer.net/",
                :match_details => "Teamer Teamer - _Teamer5_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_Teamer5_session=/i,
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
