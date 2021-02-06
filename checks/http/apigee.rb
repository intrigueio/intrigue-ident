module Intrigue
  module Ident
    module Check
      module Private
        class Apigee < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Apigee",
                :product => "Apigee Router Web Server",
                :website => "https://cloud.google.com/apigee/",
                :match_details => "Apigee Apigee Router Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Apigee Router/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Apigee",
                :product => "Load Balancer",
                :website => "https://docs.apigee.com/api-platform/deploy/load-balancing-across-backend-servers",
                :match_details => "Apigee Load Balancer - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: Apigee LB/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://145.128.81.102:80"],
              },
            ]
          end
        end
      end
    end
  end
end
