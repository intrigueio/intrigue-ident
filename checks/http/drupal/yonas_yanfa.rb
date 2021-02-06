module Intrigue
  module Ident
    module Check
      module Private
        class YonasYanfa < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Yonas Yanfa",
                :product => "Calendar",
                :website => "https://www.drupal.org/project/calendar",
                :match_details => "Yonas Yanfa Calendar - calendar_multiday.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<link.*href=".*\/)calendar_multiday.css/i,
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
