module Intrigue
  module Ident
    module Check
      module Private
        class DerekAhmedzai < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Derek Ahmedzai",
                :product => "FitVids",
                :website => "https://www.drupal.org/project/fitvids",
                :match_details => "Derek Ahmedzai FitVids - fitvids.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/fitvids\\\/|<script.*src=".*\/fitvids\/)fitvids.js/i,
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
