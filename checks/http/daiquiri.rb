module Intrigue
  module Ident
    module Check
      module Private
        class Daiquiri < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Library"],
                :vendor => "Daiquiri",
                :product => "Daiquiri",
                :website => "https://github.com/jd/daiquiri",
                :match_details => "Daiquiri Daiquiri - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: daiquiri/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^Server: daiquiri\/(\d+(\.\d+)*)/i)
                },
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Library"],
                :vendor => "Daiquiri",
                :product => "Daiquiri",
                :website => "https://github.com/jd/daiquiri",
                :match_details => "Daiquiri Daiquiri - x-daiquiri-instance Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /x-daiquiri-instance:/i,
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
