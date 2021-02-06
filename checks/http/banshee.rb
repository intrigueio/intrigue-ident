module Intrigue
  module Ident
    module Check
      module Private
        class Banshee < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Banshee",
                :product => "Banshee",
                :website => "http://www.banshee-php.org/",
                :match_details => "Banshee - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Banshee PHP framework/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Banshee PHP framework v(\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Banshee",
                :product => "Banshee",
                :website => "http://www.banshee-php.org/",
                :match_details => "Banshee - built by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /built upon the\s*<a href="https:\/\/www.banshee-php.org\/">Banshee PHP framework<\/a>/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /built upon the\s*<a href="https:\/\/www.banshee-php.org\/">Banshee PHP framework<\/a>\s*v(\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Banshee",
                :product => "Banshee",
                :website => "http://www.banshee-php.org/",
                :match_details => "Banshee - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Powered-By: Banshee PHP framework/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^X-Powered-By: Banshee PHP framework v(\d+(\.\d+)*)/i)
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
end
