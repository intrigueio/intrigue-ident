module Intrigue
  module Ident
    module Check
      module Private
        class FieldGroup < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Field Group",
                :product => "Field Group",
                :website => "https://www.drupal.org/project/field_group",
                :match_details => "Field Group - javascript page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script src=".*\/)field_group\.(min\.)?js(\?[a-z0-9]*)?"/i,
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
