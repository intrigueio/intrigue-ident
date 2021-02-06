module Intrigue
  module Ident
    module Check
      module Private
        class Telekom < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Telekom",
                :product => "Telekom",
                :website => "https://www.telekom.com/en",
                :match_details => "Telekom Web Server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ Telekom$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Telecommunications", "IoT"],
                :vendor => "Telekom",
                :product => "Telepresence Manager",
                :website => "https://manager.telepresence.telekom.com/login",
                :match_details => "Telekom Telepresence Manager - telepresence_manager_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /telepresence_manager_session=/i,
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
