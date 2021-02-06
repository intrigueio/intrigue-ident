module Intrigue
  module Ident
    module Check
      class Cubecart < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["E-commerce"],
              :vendor => "Cubecart",
              :product => "Cubecart",
              :website => "http://www.cubecart.com/",
              :match_details => "Cubecart - generator tag page reference",
              :version => nil,
              :match_type => :content_body,
              :match_content => /<meta name="generator" content="Cubecart"/i,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => true,
            },
          ]
        end
      end
    end
  end
end
