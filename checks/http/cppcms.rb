module Intrigue
  module Ident
    module Check
      module Private
        class Cppcms < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "CppCMS",
                :product => "CppCMS",
                :website => "http://cppcms.com/",
                :match_details => "CppCMS - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: CppCMS/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^x-powered-by: CppCMS\/(\d+(\.\d+)*)/i)
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
