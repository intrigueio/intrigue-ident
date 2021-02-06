module Intrigue
  module Ident
    module Check
      class Swiftlet < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["Web Framework"],
              :vendor => "Swiftlet",
              :product => "Swiftlet",
              :website => "http://swiftlet.org/",
              :match_details => "Swiftlet - generator tag page reference",
              :version => nil,
              :match_type => :content_body,
              :match_content => /<meta name="generator" content="Swiftlet - http:\/\/swiftlet\.org/i,
              :hide => false,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["Web Framework"],
              :vendor => "Swiftlet",
              :product => "Swiftlet",
              :website => "http://swiftlet.org/",
              :match_details => "Swiftlet - X-Generator header",
              :version => nil,
              :match_type => :content_headers,
              :match_content => /^X-Generator: Swiftlet/i,
              :hide => false,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["Web Framework"],
              :vendor => "Swiftlet",
              :product => "Swiftlet",
              :website => "http://swiftlet.org/",
              :match_details => "Swiftlet - X-Powered-By header",
              :version => nil,
              :match_type => :content_headers,
              :match_content => /^X-Powered-By: Swiftlet/i,
              :hide => false,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["Web Framework"],
              :vendor => "Swiftlet",
              :product => "Swiftlet",
              :website => "http://swiftlet.org/",
              :match_details => "Swiftlet - X-Swiftlet-Cache header",
              :version => nil,
              :match_type => :content_headers,
              :match_content => /^X-Swiftlet-Cache:/i,
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
