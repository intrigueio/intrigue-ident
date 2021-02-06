module Intrigue
  module Ident
    module Check
      module Private
        class Cloudcart < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "CloudCart",
                :product => "CloudCart",
                :website => "http://cloudcart.com/",
                :match_details => "CloudCart - author page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="author" content="CloudCart/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="author" content="CloudCart (\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "CloudCart",
                :product => "CloudCart",
                :website => "http://cloudcart.com/",
                :match_details => "CloudCart - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /have an online store just like this website - Create your store with <a href="https:\/\/cloudcart.com">https:\/\/cloudcart.com/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "CloudCart",
                :product => "CloudCart",
                :website => "http://cloudcart.com/",
                :match_details => "CloudCart - powered by page reference",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /x-powered-by: cloudcart\.com/i,
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
