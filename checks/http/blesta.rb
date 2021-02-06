module Intrigue
  module Ident
    module Check
      module Private
        class Blesta < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Blesta",
                :product => "Blesta",
                :website => "http://www.blesta.com/",
                :match_details => "Blesta - blesta_sid cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /blesta_sid=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Blesta",
                :product => "Blesta",
                :website => "http://www.blesta.com/",
                :match_details => "Blesta - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /\* Blesta Javascript Library v(\d+(\.\d+)*)/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /\* Blesta Javascript Library \v(\d+(\.\d+)*)/i)
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
