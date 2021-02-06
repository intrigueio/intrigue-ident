module Intrigue
  module Ident
    module Check
      module Private
        class Samsung < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Samsung",
                :product => "SmartThings Web Server",
                :website => "http://smartthings.com/",
                :match_details => "Samsung SmartThings Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: SmartThings/i,
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
