module Intrigue
  module Ident
    module Check
      module Private
        class Achmea < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Achmea",
                :product => "Independer Web Server",
                :website => "http://www.independer.nl/",
                :match_details => "Achmea Independer Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Independer/,
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
