module Intrigue
  module Ident
    module Check
      module Private
        class Solusquare < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Solusquare",
                :product => "Solusquare",
                :website => "https://www.solusquare.com/",
                :match_details => "Solusquare - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Solusquare"/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Solusquare",
                :product => "Solusquare",
                :website => "https://www.solusquare.com/",
                :match_details => "Solusquare - _solusquare cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_solusquare/i,
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
