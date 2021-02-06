module Intrigue
  module Ident
    module Check
      module Private
        class PictureProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Picture Project",
                :product => "Picture",
                :website => "https://www.drupal.org/project/picture",
                :match_details => "Picture Project Picture - picturefill.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/picture\\\/picturefill2\\\/|<script src=".*\/picture\/picturefill2\/)picturefill.min.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Picture Project",
                :product => "Picture",
                :website => "https://www.drupal.org/project/picture",
                :match_details => "Picture Project Picture - picture.min.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/picture\\\/|<script src=".*\/picture\/)picture.min.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Picture Project",
                :product => "Picture",
                :website => "https://www.drupal.org/project/picture",
                :match_details => "Picture Project Picture - picture_wysiwyg.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/picture\\\/|<link.*href=".*\/picture\/)picture_wysiwyg.css/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
