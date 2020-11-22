module Intrigue
  module Ident
    module Check
      class ShopFactory < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["CMS"],
              :vendor => "ShopFactory",
              :product => "ShopFactoryCMS",
              :website => "https://shopfa.com/",
              :match_details => "Shopfa - generator tag page reference",
              :version => nil,
              :match_type => :content_body,
              :match_content => /<meta name="generator" content="Shopfa/i,
              :dynamic_version => lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="Shopfa (\d+(\.\d+)*)/i)
              },
              :hide => false,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["CMS"],
              :vendor => "ShopFactory",
              :product => "ShopFactoryCMS",
              :website => "https://shopfa.com/",
              :match_details => "Shopfa - powered by page reference",
              :version => nil,
              :match_type => :content_body,
              :match_content => /<!--\s*Cooked by ShopFA/i,
              :dynamic_version => lambda { |x|
                _first_body_capture(x, /<!--\s*Cooked by ShopFA v(\d+(\.\d+)*)/i)
              },
              :hide => false,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["CMS"],
              :vendor => "ShopFactory",
              :product => "ShopFactoryCMS",
              :website => "https://shopfa.com/",
              :match_details => "Shopfa - x-powered-by header",
              :version => nil,
              :match_type => :content_headers,
              :match_content => /^x-powered-by: ShopFA/i,
              :dynamic_version => lambda { |x|
                _first_header_capture(x, /^x-powered-by: ShopFA (\d+(\.\d+)*)/i)
              },
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
