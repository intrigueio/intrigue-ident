module Intrigue
  module Ident
    module Check
      module Private
        class AlexPott < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Alex Pott",
                :product => "Floating block",
                :website => "https://www.drupal.org/project/floating_block",
                :match_details => "Alex Pott Floating block - floating_block.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script.*src=".*\/)floating_block.js/i,
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
