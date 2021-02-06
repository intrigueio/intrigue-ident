module Intrigue
  module Ident
    module Check
      module Private
        class DeltaAirlines < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Delta Airlines, Inc",
                :product => "Delta Airlines",
                :website => "https://www.delta.com/gb/en",
                :match_details => "Delta Arlines server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Delta Airlines\, Inc$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Delta Airlines, Inc",
                :product => "Delta Airlines",
                :website => "https://www.delta.com/gb/en",
                :match_details => "Delta Airlines response header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Delta Airlines, Inc$/i,
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
