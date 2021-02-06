module Intrigue
  module Ident
    module Check
      module Private
        class Didrocks < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "didrocks",
                :product => "chuck-norris-webserver",
                :website => "https://github.com/didrocks/chuck-norris-webserver",
                :match_details => "didrocks chuck-norris-webserver - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Chuck_Norris/i,
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
