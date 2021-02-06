module Intrigue
  module Ident
    module Check
      module Private
        class DanDomain < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hosting"],
                :vendor => "DanDomain",
                :product => "DanDomain Manager",
                :website => "https://www.dandomain.dk/",
                :match_details => "DanDomain DanDomain Manager - x-backend Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /x-backend: dandomaindk/i,
                :dynamic_version => lambda { |x|
                  local_version = _first_header_capture(x, /x-backend: dandomaindk\/manager(\d+)/i)
                  version = local_version.split(//).join(".")
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://194.150.112.14:80"],
              },
            ]
          end
        end
      end
    end
  end
end
