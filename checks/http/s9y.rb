module Intrigue
  module Ident
    module Check
      module Private
        class S9y < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "s9y",
                :product => "Serendipity",
                :references => ["https://docs.s9y.org/"],
                :match_details => "Serendipity - Powered-By tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="Powered-By" content="Serendipity/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="Powered-By" content="Serendipity v.(\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "s9y",
                :product => "Serendipity",
                :references => ["https://docs.s9y.org/"],
                :match_details => "Serendipity - x-blog header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-blog: Serendipity/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "s9y",
                :product => "Serendipity",
                :references => ["https://docs.s9y.org/"],
                :match_details => "Serendipity - x-serendipity-contentlang header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-serendipity-contentlang/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "s9y",
                :product => "Serendipity",
                :references => ["https://docs.s9y.org/"],
                :match_details => "Serendipity - x-serendipity-ml-sl-\d+ header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-serendipity-ml-sl-\d+/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "s9y",
                :product => "Serendipity",
                :references => ["https://docs.s9y.org/"],
                :match_details => "Serendipity - s9y_ cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /s9y_/i,
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
