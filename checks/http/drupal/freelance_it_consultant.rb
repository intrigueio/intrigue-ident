module Intrigue
  module Ident
    module Check
      module Private
        class FreeLanceItConsultant < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "freelance-it-consultant",
                :product => "EU Cookie Compliance",
                :website => "https://www.drupal.org/project/eu_cookie_compliance",
                :references => ["http://freelance-it-consultant.com/services"],
                :match_details => "freelance-it-consultant EU Cookie Compliance - eu_cookie_compliance.bare.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/eu_cookie_compliance\\\/css\\\/|<link.*href=".*\/eu_cookie_compliance\/css\/)eu_cookie_compliance.bare.css/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "freelance-it-consultant",
                :product => "EU Cookie Compliance",
                :website => "https://www.drupal.org/project/eu_cookie_compliance",
                :references => ["http://freelance-it-consultant.com/services"],
                :match_details => "freelance-it-consultant EU Cookie Compliance - eu_cookie_compliance.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :require_product => "Drupal",
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/eu_cookie_compliance\\\/js\\\/|<script.*src=".*\/eu_cookie_compliance\/js\/)eu_cookie_compliance.js/i,
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
