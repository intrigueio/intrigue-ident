module Intrigue
  module Ident
    module Check
      module Private
        class DNSPod < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Hosting", "Security", "SaaS"],
                :vendor => "DNSPod",
                :product => "DNSPod",
                :website => "http://www.dnspod.com/",
                :match_details => "DNSPod DNSPod - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: DNSPod URL/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^Server: DNSPod URL V(\d+(\.\d+)*)/i)
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
