module Intrigue
  module Ident
    module Check
      module Private
        class Skava < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Skava",
                :product => "Skava",
                :website => "https://www.skava.com/",
                :match_details => "Skava - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /server: Skava/i,
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
