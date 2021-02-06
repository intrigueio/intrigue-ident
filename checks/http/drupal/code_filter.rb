module Intrigue
  module Ident
    module Check
      module Private
        class CodeFilterProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Code Filter Project",
                :product => "Code Filter",
                :website => "https://www.drupal.org/project/codefilter",
                :match_details => "Code Filter Project Code Filter - codefilter.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/codefilter\\\/|<script.*src=".*\/codefilter\/)codefilter.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Code Filter Project",
                :product => "Code Filter",
                :website => "https://www.drupal.org/project/codefilter",
                :match_details => "Code Filter Project Code Filter - codefilter.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/codefilter\\\/|<link.*href=".*\/codefilter\/)codefilter.css/i,
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
