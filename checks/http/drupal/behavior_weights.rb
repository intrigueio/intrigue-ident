module Intrigue
  module Ident
    module Check
      module Private
        class BehaviorWeightsProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Behavior weights Project",
                :product => "Behavior weights",
                :website => "https://www.drupal.org/project/behavior_weights",
                :match_details => "Behavior weights Project Behavior weights - behavior_weights.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/behavior_weights\\\/|<link.*href=".*\/behavior_weights\/)behavior_weights.js/i,
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
