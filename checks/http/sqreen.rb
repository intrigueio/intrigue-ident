module Intrigue
  module Ident
    module Check
      module Private
        class Sqreen < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Sqreen",
                :product => "Sqreen",
                :website => "https://www.sqreen.io/",
                :match_details => "Sqreen - x-protected-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-protected-by: Sqreen$/i,
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
