module Intrigue
  module Ident
    module Check
      module Private
        class CM4all < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "CM4all",
                :product => "Web Server",
                :website => "https://www.cm4all.com/",
                :match_details => "CM4all - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ CM4all\ Webserver$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://80.150.6.137:80/"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "CM4all",
                :product => "Beng",
                :website => "https://github.com/CM4all/beng-proxy",
                :match_details => "CM4all Beng - beng_proxy_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /beng_proxy_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://80.150.6.137:80/"],
              },
            ]
          end
        end
      end
    end
  end
end
