module Intrigue
  module Ident
    module Check
      module Private
        class SAML < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["SSO", "Security"],
                :vendor => "Security Assertion Markup Language",
                :product => "Security Assertion Markup Language",
                :website => "https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language",
                :match_details => "Security Assertion Markup Language - SimpleSAMLSessionID Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /SimpleSAMLSessionID=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://lead.nike.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["SSO", "Security"],
                :vendor => "Security Assertion Markup Language",
                :product => "Security Assertion Markup Language",
                :website => "https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language",
                :match_details => "Security Assertion Markup Language - saml_request_path Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /saml_request_path=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://146.197.184.8:443"],
              },
            ]
          end
        end
      end
    end
  end
end
