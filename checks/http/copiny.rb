module Intrigue
  module Ident
    module Check
      module Private
        class Copiny < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["COTS"],
                :vendor => "Copiny",
                :product => "Copiny",
                :website => "https://copiny.com/",
                :match_details => "Copiny - COPINY_SESS cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /COPINY_SESS=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://copiny.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
