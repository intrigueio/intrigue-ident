module Intrigue
  module Ident
    module Check
      module Private
        class ChaosToolSuiteProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Chaos Tool Suite Project",
                :product => "ctools",
                :website => "https://www.drupal.org/project/ctools",
                :match_details => "Chaos Tool Suite Project ctools - ctools.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/ctools\\\/css\\\/|<link.*href=".*\/ctools\/css\/)ctools.css/i,
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
