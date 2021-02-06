module Intrigue
  module Ident
    module Check
      module Private
        class Spray < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Spray",
                :product => "Spray",
                :website => "http://spray.io/",
                :match_details => "Spray Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: spray-can/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^server: spray-can\/(\d+(\.\d+)*)$/i)
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
