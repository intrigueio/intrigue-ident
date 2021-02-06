module Intrigue
  module Ident
    module Check
      module Private
        class CodeCrafters < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Mail Server"],
                :vendor => "CodeCrafters",
                :product => "Ability Mail Server",
                :website => "https://www.codecrafters.com/AbilityMailServer",
                :match_details => "CodeCrafters Ability Mail Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Code Crafters Ability Mail Server/i,
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
