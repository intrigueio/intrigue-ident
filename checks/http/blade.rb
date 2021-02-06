module Intrigue
  module Ident
    module Check
      module Private
        class Blade < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Blade",
                :product => "Blade",
                :website => "https://lets-blade.com/",
                :match_details => "Blade - X-Powered-By header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Powered-By: blade-/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^X-Powered-By: blade-(\d+(\.\d+)*)/i)
                },
                :dynamic_update => lambda { |x|
                  _first_header_capture(x, /^X-Powered-By: blade[-(](?:\d+(?:\.\d+)*)[.-](.*)\)?/i)
                },
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
