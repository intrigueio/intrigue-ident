module Intrigue
  module Ident
    module Check
      module Private
        class DocuSign < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "DocuSign",
                :product => "DocuSign",
                :website => "https://www.docusign.co.uk/",
                :match_details => "DocuSign - X-DocuSign-Node header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-DocuSign-Node:/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "DocuSign",
                :product => "DocuSign",
                :website => "https://www.docusign.co.uk/",
                :references => ["https://clouddocs.f5.com/products/agc/v2.0/saml-saas-applications/DocuSign.html"],
                :match_details => "DocuSign - BIGipDocuSign cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /BIGipDocuSign_/i,
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
