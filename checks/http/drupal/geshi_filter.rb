module Intrigue
  module Ident
    module Check
      module Private
        class GeSHiFilterProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "GeSHi Filter Project",
                :product => "GeSHi Filter for syntax highlighting",
                :website => "https://www.drupal.org/project/geshifilter",
                :match_details => "GeSHi Filter Project GeSHi Filter for syntax highlighting - geshifilter.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/geshifilter\\\/|<link.*href=".*\/geshifilter\/)geshifilter.css/i,
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
