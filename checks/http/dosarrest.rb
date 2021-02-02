module Intrigue
  module Ident
    module Check
      class DOSarrest < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "service",
              :tags => ["CDN", "WAF"],
              :vendor => "DOSarrest",
              :product => "DOSarrest",
              :references => ["https://www.dosarrest.com/"],
              :version => nil,
              :match_type => :content_headers,
              :match_content => /^server:.*DOSarrest/i,
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
