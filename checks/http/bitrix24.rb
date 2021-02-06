module Intrigue
  module Ident
    module Check
      module Private
        class Bitrix24 < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CRM", "SaaS"],
                :vendor => "Bitrix24",
                :product => "Bitrix24",
                :website => "https://www.bitrix24.com/",
                :match_details => "Bitrix24 Bitrix24 - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /Server: Bitrix24\.Sites/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CRM", "SaaS"],
                :vendor => "Bitrix24",
                :product => "Bitrix24",
                :website => "https://www.bitrix24.com/",
                :match_details => "Bitrix24 Bitrix24 - X-Powered-CMS Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /X-Powered-CMS: Bitrix24\.Sites/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
