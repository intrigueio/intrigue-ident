module Intrigue
  module Ident
    module Check
      module Private
        class Swiftengine < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Swift Engine",
                :product => "Swift Engine",
                :website => "http://mittec.ru/default",
                :match_details => "Swift Engine - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: swift\.engine/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^x-powered-by: swift\.engine v(\d+(\.\d+)*)"/)
                },
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
