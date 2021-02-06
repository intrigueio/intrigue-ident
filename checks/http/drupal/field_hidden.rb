module Intrigue
  module Ident
    module Check
      module Private
        class FieldHiddenProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Field Hidden Project",
                :product => "Field Hidden",
                :website => "https://www.drupal.org/project/field_hidden",
                :match_details => "Field Hidden Project Field Hidden - field_hidden.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/field_hidden\\\/|<link.*href=".*\/field_hidden\/)field_hidden.css/i,
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
