module Intrigue
  module Ident
    module Check
      module Private
        class TiAssisto24 < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "TiAssisto24",
                :product => "TiAssisto24",
                :website => "http://www.tiassisto24.it/",
                :match_details => "TiAssisto24 - TA24SESSION Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /TA24SESSION=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "TiAssisto24",
                :product => "TiAssisto24",
                :website => "http://www.tiassisto24.it/",
                :match_details => "TiAssisto24 - TA24SESSIONID Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /TA24SESSIONID=/,
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
