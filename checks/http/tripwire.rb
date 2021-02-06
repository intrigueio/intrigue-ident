module Intrigue
  module Ident
    module Check
      module Private
        class Tripwire < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Tripwire",
                :product => "Tripwire Appliance Web Server",
                :website => "https://www.maxum.com/Rumpus/",
                :match_details => "Tripwire Tripwire Appliance Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Tripwire Appliance/i,
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
