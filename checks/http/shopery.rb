module Intrigue
  module Ident
    module Check
      class Shopery < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "service",
              :tags => ["E-commerce"],
              :vendor => "Shopery",
              :product => "Shopery",
              :references => ["https://shopery.com/"],
              :match_details => "Shopery - x-shopery header",
              :version => nil,
              :match_type => :content_body,
              :match_content => /x-shopery:/i,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => true,
            },
          ]
        end
      end
    end
  end
end
