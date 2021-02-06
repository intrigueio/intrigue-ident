module Intrigue
  module Ident
    module Check
      module Private
        class Typecho < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Typecho",
                :product => "Typecho",
                :website => "http://typecho.org/",
                :match_details => "Typecho - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Typecho/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Typecho (\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Typecho",
                :product => "Typecho",
                :website => "http://typecho.org/",
                :match_details => "Typecho - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Powered by\s*<a target="blank" href="http:\/\/www.typecho.org">Typecho/i,
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
