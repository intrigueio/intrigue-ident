module Intrigue
  module Ident
    module Check
      module Private
        class DeluxeEntertainment < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Deluxe Entertainment",
                :product => "Deluxe One Web Server",
                :website => "https://www.bydeluxe.com/en/one/",
                :match_details => "Deluxe Entertainment Deluxe One Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Deluxe/,
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
