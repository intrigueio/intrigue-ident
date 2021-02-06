module Intrigue
  module Ident
    module Check
      module Private
        class TheTapLab < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social", "Entertainment"],
                :vendor => "The Tap Lab",
                :product => "The Tap Lab",
                :website => "https://thetaplab.com/",
                :match_details => "The Tap Lab The Tap Lab - _thetaplab_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_thetaplab_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.thetaplab.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
