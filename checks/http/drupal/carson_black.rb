module Intrigue
  module Ident
    module Check
      module Private
        class CarsonBlack < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Carson Black",
                :product => "Trumba",
                :website => "https://www.drupal.org/project/trumba",
                :match_details => "Carson Black Trumba - trumba.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/trumba\\\/js\\\/|<script.*src=".*\/trumba\/js\/)trumba.js/i,
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
