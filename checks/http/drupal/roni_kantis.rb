module Intrigue
  module Ident
    module Check
      module Private
        class RoniKantis < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Roni Kantis",
                :product => "Context Accordion",
                :website => "drupal.org/project/context_accordion",
                :match_details => "Roni Kantis Context Accordion - context_accordion.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/context_accordion\\\/|<script.*src=".*\/context_accordion\/)context_accordion.js/i,
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
