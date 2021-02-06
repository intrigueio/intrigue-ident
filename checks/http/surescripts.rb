module Intrigue
  module Ident
    module Check
      module Private
        class Surescripts < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Surescripts",
                :product => "Surescripts Web Server",
                :website => "https://surescripts.com/",
                :match_details => "Surescripts Surescripts Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Surescripts/,
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
