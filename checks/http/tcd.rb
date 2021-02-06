module Intrigue
  module Ident
    module Check
      module Private
        class TrinityCollegeDublin < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Education"],
                :vendor => "Trinity College Dublin",
                :product => "Trinity College Dublin",
                :website => "https://www.tcd.ie/",
                :match_details => "Trinity College Dublin Trinity College Dublin - _tcd_hyrax_app3_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_tcd_hyrax_app3_session=/i,
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
