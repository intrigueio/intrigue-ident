module Intrigue
  module Ident
    module Check
      module Private
        class Cotonti < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Cotonti",
                :product => "Cotonti Siena",
                :website => "http://www.cotonti.com/",
                :match_details => "Cotonti - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Cotonti/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Cotonti",
                :product => "Cotonti Siena",
                :website => "http://www.cotonti.com/",
                :match_details => "Cotonti - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Powered by\s*<a href="http:\/\/cotonti.com" target="_blank">Cotonti/i,
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
