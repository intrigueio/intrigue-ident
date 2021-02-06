module Intrigue
  module Ident
    module Check
      module Private
        class Tomatocart < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "TomatoCart",
                :product => "TomatoCart",
                :website => "http://tomatocart.com/",
                :match_details => "TomatoCart - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="TomatoCart -- Open Source Shopping Cart Solution"/i,
                :hide => false,
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
