module Intrigue
  module Ident
    module Check
      module Private
        class Apple < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Apple",
                :product => "Apple Web Server",
                :website => "https://www.apple.com/",
                :match_details => "Apple web server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: apple$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Apple",
                :product => "Apple Web Server",
                :website => "https://www.apple.com/",
                :match_details => "Apple HTTPServer - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: AppleHttpServer\/(.*)$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Apple",
                :product => "Apple Software Update Server",
                :website => "https://www.apple.com/",
                :match_details => "Apple Software Update Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Apple Software Update Server$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Apple",
                :product => "Apple LCDN Registration Server",
                :website => "https://www.apple.com/",
                :match_details => "Apple LCDN Registration Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Apple LCDN Registration Server$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Apple",
                :product => "Apple Software Update Server",
                :website => "https://www.apple.com/",
                :match_details => "Apple Software Update Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Apple Software Update Server$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Apple",
                :product => "Apple Web Server",
                :website => "https://www.apple.com/",
                :match_details => "Apple Web Server - X-Apple-Request-UUID Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Apple-Request-UUID:/i,
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
