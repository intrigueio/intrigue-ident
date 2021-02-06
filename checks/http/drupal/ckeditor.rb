module Intrigue
  module Ident
    module Check
      module Private
        class CKEditor < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "CKEditor",
                :product => "CKEditor",
                :website => "https://www.drupal.org/project/ckeditor",
                :match_details => "CKEditor CKEditor - ckeditor.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/ckeditor\\\/css\\\/|<link.*href=".*\/ckeditor\/css\/)ckeditor.css/i,
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
