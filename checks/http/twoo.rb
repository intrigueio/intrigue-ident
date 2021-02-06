module Intrigue
  module Ident
    module Check
      module Private
        class Twoo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Frontend"],
                :vendor => "Twoo",
                :product => "Twoo",
                :website => "https://www.twoo.com/",
                :match_details => "Twoo - tw_ses Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /tw_ses=/,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Frontend"],
                :vendor => "Twoo",
                :product => "Twoo",
                :website => "https://www.twoo.com/",
                :match_details => "Twoo - tw_twoo_lng Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /tw_twoo_lng=/,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Frontend"],
                :vendor => "Twoo",
                :product => "Twoo",
                :website => "https://www.twoo.com/",
                :match_details => "Twoo - tw_c Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /tw_c=/,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Frontend"],
                :vendor => "Twoo",
                :product => "Twoo",
                :website => "https://www.twoo.com/",
                :match_details => "Twoo - twoopersistence Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /twoopersistence=/,
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
