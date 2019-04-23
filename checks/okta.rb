module Intrigue
module Ident
module Check
    class Okta < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["SaaS","IAM"],
            :vendor =>"Okta",
            :product =>"Okta",
            :match_details =>"okta header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-okta-backend/i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["SaaS","IAM"],
            :vendor =>"Okta",
            :product =>"Okta",
            :match_details =>"okta header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-okta-request-id/i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["IAM","SaaS"],
            :vendor =>"Okta",
            :product =>"Okta",
            :match_details =>"okta container div",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /class="auth okta-container">/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
