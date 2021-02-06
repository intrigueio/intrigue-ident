module Intrigue
  module Ident
    module Check
      module Private
        class Teamo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Social"],
                :vendor => "Teamo",
                :product => "Teamo",
                :website => "https://teamo.ru/",
                :match_details => "Teamo - teamo cookie.",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /teamo=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
                :test_target => ["https://teamo.ru/znakomstva-v-zernograde"],
              },
            ]
          end
        end
      end
    end
  end
end
