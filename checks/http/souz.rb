module Intrigue
  module Ident
    module Check
      module Private
        class Souz < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Souz",
                :product => "Souz",
                :website => "https://ko.souz.mail.ru/",
                :match_details => "Souz - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /server: imagine\/souz/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://ko.souz.mail.ru/"],
              },
            ]
          end
        end
      end
    end
  end
end
