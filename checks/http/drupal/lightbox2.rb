module Intrigue
  module Ident
    module Check
      module Private
        class Lightbox2Project < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Lightbox2 Project",
                :product => "Lightbox2",
                :website => "https://www.drupal.org/project/lightbox2",
                :match_details => "Lightbox2 Project Lightbox2 - lightbox.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/lightbox2\\\/js\\\/|<script.*src=".*\/lightbox2\/js\/)lightbox.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Lightbox2 Project",
                :product => "Lightbox2",
                :website => "https://www.drupal.org/project/lightbox2",
                :match_details => "Lightbox2 Project Lightbox2 - lightbox.css Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/lightbox2\\\/css\\\/|<link.*href=".*\/lightbox2\/css\/)lightbox.css/i,
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
