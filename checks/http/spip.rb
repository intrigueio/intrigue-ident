module Intrigue
  module Ident
    module Check
      module Private
        class Spip < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "SPIP",
                :product => "SPIP",
                :website => "https://www.spip.net/spip.php?page=plan&lang=en",
                :match_details => "SPIP - composed-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^composed-by: SPIP/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^composed-by: SPIP (\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "SPIP",
                :product => "SPIP",
                :website => "https://www.spip.net/spip.php?page=plan&lang=en",
                :match_details => "SPIP - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="SPIP/i,
                :dynamic_version => lambda { |x|
                  version = _first_body_capture(x, /<meta name="generator" content="SPIP (\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "SPIP",
                :product => "SPIP",
                :website => "https://www.spip.net/spip.php?page=plan&lang=en",
                :match_details => "SPIP - x-spip-cache header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-spip-cache:/i,
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
