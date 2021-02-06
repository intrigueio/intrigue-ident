module Intrigue
  module Ident
    module Check
      module Private
        class Atmail < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Collaboration"],
                :vendor => "atmail",
                :product => "atmail",
                :website => "http://atmail.com/",
                :match_details => "atmail atmail - atmail Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /atmail\d=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://185.20.207.28:80"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Collaboration"],
                :vendor => "atmail",
                :product => "atmail",
                :website => "http://atmail.com/",
                :match_details => "atmail atmail - Powered by Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<a.*>Powered by Atmail/i,
                :dynamic_version => lambda { |x|
                  version = _first_body_capture(x, /<a.*>Powered by Atmail (\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://185.20.207.28:80"],
              },
            ]
          end
        end
      end
    end
  end
end
