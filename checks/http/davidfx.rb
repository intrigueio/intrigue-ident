module Intrigue
  module Ident
    module Check
      module Private
        class Davidfx < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "David.fx",
                :product => "David WebBox",
                :website => "http://www.tobit.com/davidfx/access/",
                :match_details => "David.fx David WebBox - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: David-WebBox/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^Server: David\-WebBox\/(\d+(\.\d+)*\D)/i)
                },
                :dynamic_update => lambda { |x|
                  update = _first_header_capture(x, /^Server: David\-WebBox\/(?:\d+(?:\.\d+)*\D) \((.*)\)/i)
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
