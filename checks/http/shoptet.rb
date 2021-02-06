module Intrigue
  module Ident
    module Check
      module Private
        class Shoptet < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Shoptet",
                :product => "Shoptet",
                :website => "http://www.shoptet.cz/",
                :match_details => "Shoptet CMS - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="web_author" content="Shoptet\.cz"/i,
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
