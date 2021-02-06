module Intrigue
  module Ident
    module Check
      module Private
        class Micropat < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "micropat",
                :product => "AddToAny Share Buttons",
                :website => "https://www.drupal.org/project/addtoany",
                :match_details => "micropat AddToAny Share Buttons - addtoany.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/addtoany\\\/js\\\/|<script.*src=".*\/addtoany\/js\/)addtoany.js/i,
                :dynamic_version => lambda { |x|
                  version = _first_body_capture(x, /[\\\/|\/]addtoany[\\\/|\/]js[\\\/|\/]addtoany.js\?v=(\d+(\.\d+)*)/i)
                },
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
