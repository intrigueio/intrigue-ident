module Intrigue
  module Ident
    module Check
      module Private
        class MatomoProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Matomo Project",
                :product => "Matomo",
                :website => "https://www.drupal.org/project/matomo",
                :match_details => "Matomo - javascript page reference",
                :version => nil,
                :require_product => "Drupal",
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script src=".*\/)matomo\.(min\.)?js(\?[a-z0-9\.\=]*)?"/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /(?:jquery\.extend\(drupal\.settings.*\\\/|<script src=".*\/)matomo\.(?:min\.)?js\?v=(\d+(\.\d+)*)"/i)
                },
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
