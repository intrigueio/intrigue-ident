module Intrigue
  module Ident
    module Check
      module Private
        class Sazito < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Sazito",
                :product => "Sazito",
                :website => "http://sazito.com/",
                :match_details => "Sazito - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Sazito"/i,
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
