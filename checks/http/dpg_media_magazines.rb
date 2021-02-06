module Intrigue
  module Ident
    module Check
      module Private
        class DPGMediaMagazines < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "DPG Media Magazines",
                :product => "Magazine Web Server",
                :website => "https://www.magazine.nl/",
                :match_details => "DPG Media Magazines Magazine Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Magazine/,
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
