module Intrigue
  module Ident
    module Check
      module Private
        class ImageLazyloaderProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Image Lazyloader Project",
                :product => "Image Lazyloader",
                :website => "https://www.drupal.org/project/lazyloader",
                :match_details => "Image Lazyloader Project Image Lazyloader - jquery.lazyloader.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/lazyloader\\\/|<script.*src=".*\/lazyloader\/)jquery.lazyloader.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Image Lazyloader Project",
                :product => "Image Lazyloader",
                :website => "https://www.drupal.org/project/lazyloader",
                :match_details => "Image Lazyloader Project Image Lazyloader - lazyloader.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/lazyloader\\\/|<link.*href=".*\/lazyloader\/)lazyloader.css/i,
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
