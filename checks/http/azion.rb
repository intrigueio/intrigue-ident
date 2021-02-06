module Intrigue
  module Ident
    module Check
      module Private
        class Azion < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Azion",
                :product => "Azion Web Server",
                :website => "https://www.azion.com/",
                :match_details => "Azion Azion Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: azion webserver/,
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
