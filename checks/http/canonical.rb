module Intrigue
  module Ident
    module Check
      class Canonical < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["Development"],
              :vendor => "Canonical",
              :product => "Juju",
              :website => "https://jaas.ai/",
              :match_details => "Canonical Juju - server header",
              :version => nil,
              :match_type => :content_headers,
              :match_content => /^server: Juju/i,
              :hide => false,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
              :test_target => ["https://wcps.t-online.de/storefront/web/-/-/text/38600"],
            },
          ]
        end
      end
    end
  end
end
