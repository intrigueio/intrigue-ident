module Intrigue
  module Ident
    module Check
      module Private
        class CubeCoders < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["ApplicationServer"],
                :vendor => "CubeCoders",
                :product => "McMyAdmin",
                :website => "https://cubecoders.com/",
                :match_details => "CubeCoders McMyAdmin - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: CubeCoders-McMyAdmin\/IAWS/i,
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
