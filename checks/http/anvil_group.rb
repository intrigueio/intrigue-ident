module Intrigue
  module Ident
    module Check
      module Private
        class AnvilGroup < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Anvil Group",
                :product => "Anvil Group Server",
                :website => "https://www.anvilgroup.com/",
                :match_details => "Anvil Group Anvil Group Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Anvil/,
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
