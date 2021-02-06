module Intrigue
  module Ident
    module Check
      module Private
        class Vardot < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin", "CMS"],
                :vendor => "Vardot",
                :product => "Varbase",
                :website => "https://drupal.org/project/varbase",
                :match_details => "Vardot Varbase - generator tag page referece",
                :version => nil,
                :match_type => :content_body,
                :require_product => "Drupal",
                :match_content => /<meta name="generator" content="Varbase"/i,
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
