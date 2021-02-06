module Intrigue
  module Ident
    module Check
      module Private
        class Actility < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["IaaS", "IoT", "COTS"],
                :vendor => "Actility",
                :product => "ThingPark",
                :website => "https://www.actility.com/enterprise-iot-connectivity-solutions/",
                :match_details => "Actility ThingPark - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: ThingPark/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "Actility",
                :product => "ThingPark",
                :website => "https://www.actility.com/products/",
                :match_details => "ThingPark - description tag reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="description" content="Thingpark Actility Enterprise">/i,
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
