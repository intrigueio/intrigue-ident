module Intrigue
  module Ident
    module Check
      module Private
        class DRMP < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "DRMP",
                :product => "DRMP Web Server",
                :website => "https://drmp.com/",
                :match_details => "DRMP DRMP Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: DRMP Web Server/i,
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
