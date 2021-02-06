module Intrigue
  module Ident
    module Check
      module Private
        class ExternalLinksProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "External Links Project",
                :product => "External Links",
                :website => "https://www.drupal.org/project/extlink",
                :match_details => "External Links Project External Links - extlink.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script.*src=".*\/)extlink.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "External Links Project",
                :product => "External Links",
                :website => "https://www.drupal.org/project/extlink",
                :match_details => "External Links Project External Links - extlink.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<link.*href=".*\/)extlink.css/i,
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
