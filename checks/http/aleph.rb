module Intrigue
  module Ident
    module Check
      module Private
        class Aleph < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Aleph",
                :product => "Aleph Web Server",
                :website => "https://aleph.io/",
                :match_details => "Aleph Web Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Aleph/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^server: Aleph\/(\d+(\.\d+)*)$/i)
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
