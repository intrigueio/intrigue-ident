module Intrigue
  module Ident
    module Check
      module Private
        class Storeden < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-commerce"],
                :vendor => "Storeden",
                :product => "Storeden",
                :website => "https://www.storeden.com/",
                :match_details => "Storeden - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Storeden$/i,
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
