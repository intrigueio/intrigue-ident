module Intrigue
  module Ident
    module Check
      module Private
        class Botpress < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Automation"],
                :vendor => "Botpress",
                :product => "Botpress",
                :website => "https://botpress.com/",
                :match_details => "Botpress - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Botpress/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false,
              },
            ]
          end
        end
      end
    end
  end
end
