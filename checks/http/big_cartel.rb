module Intrigue
  module Ident
    module Check
      module Private
        class BigCartel < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Big Cartel",
                :product => "Big Cartel",
                :website => "https://www.bigcartel.com/",
                :match_details => "Big Cartel - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Big Cartel/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Big Cartel",
                :product => "Big Cartel",
                :website => "https://www.bigcartel.com/",
                :match_details => "Big Cartel - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<a href=".+" title="Start your own store at Big Cartel now">Online Store by Big Cartel/i,
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
