module Intrigue
  module Ident
    module Check
      module Private
        class Seravo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["PaaS"],
                :vendor => "Seravo",
                :product => "Seravo",
                :website => "https://seravo.com/",
                :match_details => "Seravo - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Seravo$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["PaaS"],
                :vendor => "Seravo",
                :product => "Seravo",
                :website => "https://seravo.com/",
                :match_details => "Seravo - x-seravo-request-id header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-seravo-request-id:/i,
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
