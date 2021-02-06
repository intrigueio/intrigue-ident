module Intrigue
  module Ident
    module Check
      module Private
        class Popin < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Popin",
                :product => "Popin",
                :website => "https://www.drupal.org/project/popin",
                :match_details => "Popin - javascript page reference",
                :version => nil,
                :require_product => "Drupal",
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script src=".*\/)popin\.(min\.)?js(\?[a-z0-9]*)?"/i,
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
