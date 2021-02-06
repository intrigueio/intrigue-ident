module Intrigue
  module Ident
    module Check
      module Private
        class Cahootify < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Marketing"],
                :vendor => "Cahootify",
                :product => "Cahootify",
                :website => "https://cahootify.com/",
                :match_details => "Cahootify Cahootify - _cahootify_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_cahootify_session=/i,
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
