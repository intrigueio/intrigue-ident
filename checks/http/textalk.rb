module Intrigue
  module Ident
    module Check
      module Private
        class Textalk < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Textalk",
                :product => "Textalk Webshop",
                :website => "https://www.textalk.se/",
                :match_details => "Textalk - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Textalk Webshop/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Textalk",
                :product => "Textalk Webshop",
                :website => "https://www.textalk.se/",
                :match_details => "Textalk - twssessid cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /twssessid_\d+=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Textalk",
                :product => "Textalk Webshop",
                :website => "https://www.textalk.se/",
                :match_details => "Textalk - webshop_login cookie",
                :version => nil,
                :match_type => :content_cookies,
                :require_product => "Textalk Webshop",
                :match_content => /webshop_login=/i,
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
