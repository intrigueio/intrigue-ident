module Intrigue
  module Ident
    module Check
      module Private
        class LanguageSwitcherDropdownProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Language Switcher Dropdown Project",
                :product => "Language Switcher Dropdown",
                :website => "https://www.drupal.org/project/lang_dropdown",
                :match_details => "Language Switcher Dropdown Project Language Switcher Dropdown - lang_dropdown.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/lang_dropdown\\\/|<script.*src=".*\/lang_dropdown\/)lang_dropdown.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Language Switcher Dropdown Project",
                :product => "Language Switcher Dropdown",
                :website => "https://www.drupal.org/project/lang_dropdown",
                :match_details => "Language Switcher Dropdown Project Language Switcher Dropdown - ddsDefault.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/lang_dropdown\\\/ddslick\\\/|<link.*href=".*\/lang_dropdown\/ddslick\/)ddsDefault.css/i,
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
