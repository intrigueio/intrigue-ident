module Intrigue
  module Ident
    module Check
      module Private
        class TiVo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "WebServer"],
                :vendor => "TiVo",
                :product => "Rovi Cloud Server",
                :website => "https://www.tivo.com/",
                :match_details => "TiVo Rovi Cloud Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: rovi cloud server/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^server: rovi cloud server\/(\d+(\.\d+)*)$/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "TiVo",
                :product => "Rovi HTTP Server",
                :website => "https://www.tivo.com/",
                :match_details => "TiVo Rovi HTTP Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Rovi-HTTP/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^server: Rovi-HTTP\/(\d+(\.\d+)*)$/i)
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
