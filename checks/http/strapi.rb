module Intrigue
  module Ident
    module Check
      module Private
        class Strapi < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "",
                :tags => ["CMS"],
                :vendor => "Strapi",
                :product => "Strapi",
                :website => "https://strapi.io/",
                :match_details => "Strapi - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Strapi <strapi\.io>$/i,
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
