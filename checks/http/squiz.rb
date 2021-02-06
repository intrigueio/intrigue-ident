module Intrigue
  module Ident
    module Check
      module Private
        class Squiz < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Squiz",
                :product => "Matrix",
                :website => "http://squiz.net/",
                :match_details => "Squiz - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Squiz Matrix/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Squiz",
                :product => "Matrix",
                :website => "http://squiz.net/",
                :match_details => "Squiz - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<!--\s*Running (MySource|Squiz) Matrix/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Squiz",
                :product => "Matrix",
                :website => "http://squiz.net/",
                :match_details => "Squiz - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /x-powered-by: Squiz Matrix/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Squiz",
                :product => "Matrix",
                :website => "http://squiz.net/",
                :match_details => "Squiz - SQ_SYSTEM_SESSION cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /SQ_SYSTEM_SESSION/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
