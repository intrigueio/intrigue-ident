module Intrigue
  module Ident
    module Check
      module Private
        class Transunion < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer", "Organization"],
                :vendor => "Transunion",
                :product => "Transunion Web Server",
                :website => "https://www.transunion.co.uk/",
                :match_details => "Transunion Transunion Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Transunion/i,
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
