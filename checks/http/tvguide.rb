module Intrigue
  module Ident
    module Check
      module Private
        class TvGuide < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Entertainment"],
                :vendor => "TvGuide",
                :product => "TvGuide",
                :website => "https://www.tvguide.com/",
                :match_details => "TvGuide - tvg_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /tvg_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.tvguide.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
