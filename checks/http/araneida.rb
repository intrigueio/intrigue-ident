module Intrigue
  module Ident
    module Check
      module Private
        class Araneida < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Araneida",
                :product => "Araneida",
                :website => "https://www.cliki.net/araneida",
                :match_details => "Araneida - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Araneida/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Araneida\/(\d+(\.\d+)*)/i)
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
