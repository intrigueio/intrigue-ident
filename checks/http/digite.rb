module Intrigue
  module Ident
    module Check
      module Private
        class Digite < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Collaboration"],
                :vendor => "Digite",
                :product => "SwiftALM",
                :website => "https://www.digite.com/swiftenterprise/",
                :match_details => "Digite SwiftALM - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: SwiftALM/i,
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
