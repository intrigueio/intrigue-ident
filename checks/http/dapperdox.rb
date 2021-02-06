module Intrigue
  module Ident
    module Check
      module Private
        class DapperDox < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["API", "Documentation", "Development"],
                :vendor => "DapperDox",
                :product => "DapperDox",
                :website => "http://dapperdox.io/",
                :match_details => "DapperDox - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: DapperDox/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: DapperDox (\d+(\.\d+)*)$/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://dev2.taxcloud.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
