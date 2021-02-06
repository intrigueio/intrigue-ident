module Intrigue
  module Ident
    module Check
      module Private
        class Sulu < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Sulu",
                :product => "Sulu",
                :website => "http://sulu.io/",
                :match_details => "Sulu - X-Generator header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Generator: Sulu/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^X-Generator: Sulu\/(\d+(\.\d+)*)/i)
                },
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
