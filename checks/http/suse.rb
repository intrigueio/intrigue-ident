module Intrigue
  module Ident
    module Check
      module Private
        class Suse < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Management"],
                :vendor => "SUSE",
                :product => "Rancher Labs",
                :website => "http://rancher.com/",
                :match_details => "SUSE Rancher Labs - X-Rancher-Version Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Rancher-Version:/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^X-Rancher-Version: v(\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Authorization Server"],
                :vendor => "SUSE",
                :product => "Portus",
                :website => "https://github.com/SUSE/Portus",
                :match_details => "SUSE Portus - _portus_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_portus_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://80.158.41.208:3000/"],
              },
            ]
          end
        end
      end
    end
  end
end
