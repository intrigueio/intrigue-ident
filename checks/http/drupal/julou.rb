module Intrigue
  module Ident
    module Check
      module Private
        class Julou < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "julou",
                :product => "PhotoSwipe",
                :website => "https://www.drupal.org/project/photoswipe",
                :match_details => "julou PhotoSwipe - photoswipe.jquery.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/photoswipe\\\/js\\\/|<script.*src=".*\/photoswipe\/js\/)photoswipe.jquery.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "julou",
                :product => "PhotoSwipe",
                :website => "https://www.drupal.org/project/photoswipe",
                :match_details => "julou PhotoSwipe - photoswipe.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :require_product => "Drupal",
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/photoswipe\\\/dist\\\/|<script.*src=".*\/photoswipe\/dist\/)photoswipe.min.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "julou",
                :product => "PhotoSwipe",
                :website => "https://www.drupal.org/project/photoswipe",
                :match_details => "julou PhotoSwipe - photoswipe.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /\/\*! PhotoSwipe - v(\d+(\.\d+)*) - \d{4}-\d{1,}-\d{1,}\s*\n*\* http:\/\/photoswipe\.com\s*\n*\* Copyright \(c\) \d{4} Dmitry Semenov; \*\//i,
                :dynamic_version => lambda { |x|
                  version = _first_body_capture(x, /\/\*! PhotoSwipe - v(\d+(\.\d+)*) - \d{4}-\d{1,}-\d{1,}\s*\n*\* http:\/\/photoswipe\.com\s*\n*\* Copyright \(c\) \d{4} Dmitry Semenov; \*\//i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "julou",
                :product => "PhotoSwipe",
                :website => "https://www.drupal.org/project/photoswipe",
                :match_details => "julou PhotoSwipe - photoswipe-ui-default.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :require_product => "Drupal",
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/photoswipe\\\/dist\\\/|<script.*src=".*\/photoswipe\/dist\/)photoswipe-ui-default.min.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "julou",
                :product => "PhotoSwipe",
                :website => "https://www.drupal.org/project/photoswipe",
                :match_details => "julou PhotoSwipe - photoswipe-ui-default.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /\/\*! PhotoSwipe Default UI - (\d+(\.\d+)*) - \d{4}-\d{1,}-\d{1,}\s*\n*\* http:\/\/photoswipe\.com\s*\n*\* Copyright \(c\) \d{4} Dmitry Semenov; \*\//i,
                :dynamic_version => lambda { |x|
                  version = _first_body_capture(x, /\/\*! PhotoSwipe Default UI - (\d+(\.\d+)*) - \d{4}-\d{1,}-\d{1,}\s*\n*\* http:\/\/photoswipe\.com\s*\n*\* Copyright \(c\) \d{4} Dmitry Semenov; \*\//i)
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
