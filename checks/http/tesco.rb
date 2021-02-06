module Intrigue
  module Ident
    module Check
      module Private
        class Tesco < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Tesco",
                :product => "Tesco Web Server",
                :website => "http://www.tesco.com/",
                :match_details => "Tesco Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Tesco Web Server$/i,
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
