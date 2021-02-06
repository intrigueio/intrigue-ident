module Intrigue
  module Ident
    module Check
      module Private
        class Mobitv < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Tarantool",
                :product => "Tarantool",
                :website => "https://github.com/tarantool/http",
                :match_details => "Tarantool - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Tarantool http/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^Server: Tarantool http \(tarantool v?(\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
                :test_target => ["http://95.163.183.190:8080/"],
              },
            ]
          end
        end
      end
    end
  end
end
