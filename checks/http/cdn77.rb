module Intrigue
  module Ident
    module Check
      module Private
        class Cdn77 < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CDN"],
                :vendor => "CDN77",
                :product => "CDN77",
                :website => "https://www.cdn77.com/",
                :match_details => "CDN77 - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: CDN77-Turbo/i,
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
