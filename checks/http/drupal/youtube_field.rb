module Intrigue
  module Ident
    module Check
      module Private
        class YouTubeFieldProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "YouTube Field Project",
                :product => "YouTube Field",
                :website => "https://www.drupal.org/project/youtube",
                :match_details => "YouTube Field Project YouTube Field - youtube.css | youtube.responsiveness.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<link.*href=".*\/)(youtube|youtube.responsiveness).css/i,
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
