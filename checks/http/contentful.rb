module Intrigue
  module Ident
    module Check
      module Private
        class Contentful < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "SaaS"],
                :vendor => "Contentful",
                :product => "Contentful",
                :website => "https://www.contentful.com/",
                :match_details => "Contentful Contentful - X-Contentful-Request-Id Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Contentful-Request-Id:/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://origin-ot.contentful.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "SaaS"],
                :vendor => "Contentful",
                :product => "Contentful",
                :website => "https://www.contentful.com/",
                :match_details => "Contentful Contentful - Contentful-Api Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Contentful-Api:/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://origin-ot.contentful.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "SaaS"],
                :vendor => "Contentful",
                :product => "Contentful",
                :website => "https://www.contentful.com/",
                :match_details => "Contentful Contentful - x-contentful-ui-version Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-contentful-ui-version:/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://app.contentful.com:80"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Contentful",
                :product => "Contentful",
                :website => "https://www.contentful.com/",
                :match_details => "Contentful Contentful Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Contentful/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://origin-ot.contentful.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
