module Intrigue
  module Ident
    module Check
      module Private
        class TransIP < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Hosting"],
                :vendor => "TransIP",
                :product => "TransIP",
                :website => "https://www.transip.nl/",
                :match_details => "TransIP TransIP - X-Powered-By Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Powered-By: TransIP/,
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
