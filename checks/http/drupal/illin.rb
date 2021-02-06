module Intrigue
  module Ident
    module Check
      module Private
        class ILLin < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "iLLin",
                :product => "Colorbox Node",
                :website => "https://www.drupal.org/project/colorbox_node",
                :match_details => "iLLin Colorbox Node - colorbox_node.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/colorbox_node\\\/|<script.*src=".*\/colorbox_node\/)colorbox_node.js/i,
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
