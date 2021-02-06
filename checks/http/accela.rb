module Intrigue
  module Ident
    module Check
      module Private
        class Accela < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Accela",
                :product => "Accela Web Server",
                :website => "http://teamtreehouse.com/",
                :match_details => "Accela Accela Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Accela/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://209.135.216.141/"],
              },
            ]
          end
        end
      end
    end
  end
end
