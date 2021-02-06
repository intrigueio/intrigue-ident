module Intrigue
  module Ident
    module Check
      module Private
        class Apusic < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Application Server"],
                :vendor => "Apusic",
                :product => "Apusic",
                :website => "http://santronics.com/index.php",
                :match_details => "Apusic - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Apusic(?: Application Server)?/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Apusic(?: Application Server)?\/(\d+(\.\d+)*)/i)
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
