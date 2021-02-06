module Intrigue
  module Ident
    module Check
      module Private
        class Computax < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "CompuTax",
                :product => "CompuOffice",
                :website => "https://www.computaxonline.com/compuweb.html?aa=10",
                :match_details => "CompuOffice - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: CompuOffice Webserver/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: CompuOffice Webserver\/(\d+(\.\d+)*)/i)
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
