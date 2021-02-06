module Intrigue
  module Ident
    module Check
      module Private
        class Superfish < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Superfish",
                :product => "Superfish",
                :website => "https://www.drupal.org/project/superfish",
                :match_details => "Superfish - javascript page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script src=".*\/)superfish\.(min\.)?js(\?[a-z0-9]*)?"/i,
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
