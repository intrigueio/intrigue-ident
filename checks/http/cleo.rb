module Intrigue
  module Ident
    module Check
      module Private
        class Cleo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["FTP"],
                :vendor => "Cleo",
                :product => "LexiCom",
                :website => "https://www.cleo.com/cleo-lexicom",
                :match_details => "Cleo LexiCom - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Cleo LexiCom/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Cleo LexiCom\/(\d+(\.\d+)*)/i)
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
