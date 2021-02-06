module Intrigue
  module Ident
    module Check
      module Private
        class Lazysizes < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Lazysizes",
                :product => "Lazysizes",
                :website => "https://www.drupal.org/project/lazysizes",
                :match_details => "Lazysizes - javascript page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script src=".*\/)lazysizes\.(min\.)?js(\?[a-z0-9]*)?"/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Lazysizes",
                :product => "Lazysizes",
                :website => "https://www.drupal.org/project/lazysizes",
                :match_details => "Lazysizes - javascript file reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /\/\*! lazysizes - .* -  Licensed MIT \*\//i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /\/\*! lazysizes - v(\d+(\.\d+)*).* -  Licensed MIT \*\//i)
                },
                :dynamic_update => lambda { |x|
                  _first_body_capture(x, /\/\*! lazysizes - v(?:\d+(?:\.\d+)*)-(\w+) -  Licensed MIT \*\//i)
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
