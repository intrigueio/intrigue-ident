module Intrigue
  module Ident
    module Check
      module Private
        class Spamspan < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "SpamSpan",
                :product => "SpamSpan",
                :website => "https://www.drupal.org/project/spamspan",
                :match_details => "SpamSpan - javascript page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script src=".*\/)spamspan\.(min\.)?js(\?[a-z0-9]*)?"/i,
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
