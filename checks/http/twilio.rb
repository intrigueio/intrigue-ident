module Intrigue
  module Ident
    module Check
      module Private
        class Twilio < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social", "Management", "VoIP"],
                :vendor => "Twilio",
                :product => "OpenVBX",
                :website => "https://github.com/twilio/OpenVBX",
                :match_details => "Twilio OpenVBX - openvbx_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /openvbx_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://198.211.110.112:80"],
              },
            ]
          end
        end
      end
    end
  end
end
