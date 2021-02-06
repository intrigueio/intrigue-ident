module Intrigue
  module Ident
    module Check
      module Private
        class Shopify < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "PaaS", "Hosting", "Analytics"],
                :vendor => "Shopify",
                :product => "Analytics Suite",
                :website => "https://www.shopify.com/",
                :match_details => "Shopify analytics suite cookie.",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_y/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "PaaS", "Hosting", "Analytics"],
                :vendor => "Shopify",
                :product => "Analytics Suite",
                :website => "https://www.shopify.com/",
                :match_details => "Shopify analytics suite cookie.",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_shopify_y/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "PaaS", "Hosting"],
                :vendor => "Shopify",
                :product => "Shopify",
                :website => "https://www.shopify.com/",
                :match_details => "Cookie usually set by a website built on the Shopify platform. Used in association with the shopping cart.",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_orig_referrer/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "PaaS", "Hosting"],
                :vendor => "Shopify",
                :product => "Shopify",
                :website => "https://www.shopify.com/",
                :match_details => "Cookie usually set by websites built on the Shopify platform. Used in association with customer login.",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /secure_customer_sig/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "PaaS", "Hosting"],
                :vendor => "Shopify",
                :product => "Shopify",
                :website => "https://www.shopify.com/",
                :match_details => "Cookie usually provided by Shopify. Used in association with checkout.",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /cart_sig/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Shopify",
                :product => "Oberlo",
                :website => "http://www.oberlo.com/",
                :match_details => "Shopify Oberlo - oberlo_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /oberlo_session=/i,
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
