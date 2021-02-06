module Intrigue
  module Ident
    module Check
      module Private
        class Citadel < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "Citadel",
                :product => "WebCit",
                :website => "http://www.citadel.com",
                :references => ["http://manpages.ubuntu.com/manpages/bionic/man8/webcit.8.html"],
                :match_details => "Citadel WebCit - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: WebCit (?:\d+(?:\.\d+)*) \/ Citadel/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^Server: WebCit (\d+(\.\d+)*) \/ Citadel/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Citadel",
                :product => "Citadel",
                :website => "http://www.citadel.com",
                :match_details => "Citadel - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:.*Citadel/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server:.*Citadel (\d+(\.\d+)*)/i)
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
