module Intrigue
  module Ident
    module Check
      module Private
        class ClickMeeting < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Communication"],
                :vendor => "ClickMeeting",
                :product => "ClickMeeting",
                :website => "http://www.clickmeeting.com/",
                :match_details => "ClickMeeting ClickMeeting - CLICKMEETING_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /CLICKMEETING_session=/i,
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
