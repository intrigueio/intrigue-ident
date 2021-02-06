module Intrigue
  module Ident
    module Check
      module Private
        class Arshadcn < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "arshadcn",
                :product => "Chosen",
                :website => "https://www.drupal.org/project/chosen",
                :match_details => "arshadcn Chosen - chosen.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script.*src=".*\/)chosen.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "arshadcn",
                :product => "Slick Carousel",
                :website => "https://www.drupal.org/project/slick",
                :match_details => "arshadcn Slick Carousel - slick.load.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :require_product => "Drupal",
                :match_content => /(\\\/|\/)slick(\\\/|\/)js(\\\/|\/)slick.load.min.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "arshadcn",
                :product => "Slick Carousel",
                :website => "https://www.drupal.org/project/slick",
                :match_details => "arshadcn Slick Carousel - slick.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :require_product => "Drupal",
                :match_content => /(\\\/|\/)slick(\\\/|\/)slick(\\\/|\/)slick.min.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "arshadcn",
                :product => "Slick Carousel",
                :website => "https://www.drupal.org/project/slick",
                :match_details => "arshadcn Slick Carousel - slick.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Docs: http:\/\/kenwheeler.github.io\/slick\s*Repo: http:\/\/github.com\/kenwheeler\/slick/i,
                :dynamic_version => lambda { |x|
                  version = _first_body_capture(x, /Version: (\d+(\.\d+)*)/i)
                },
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
