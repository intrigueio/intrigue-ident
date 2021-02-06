module Intrigue
  module Ident
    module Check
      module Private
        class Baltneta < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Baltneta",
                :product => "Baltneta CDN Web Server",
                :website => "https://www.balt.net/content-delivery-network-cdn",
                :match_details => "Baltneta Baltneta CDN Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: BaltnetaCDN/i,
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
