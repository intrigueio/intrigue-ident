module Intrigue
  module Ident
    module Check
      module Private
        class Bluecoat < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "",
                :tags => ["Proxy"],
                :vendor => "Bluecoat",
                :product => "WebProxy",
                :website => "https://www.bluecoat.com/",
                :match_details => "Bluecoat - BCSI-CS-# cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /BCSI-CS-\d+=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "",
                :tags => ["Proxy"],
                :vendor => "Bluecoat",
                :product => "WebProxy",
                :website => "https://www.bluecoat.com/",
                :match_details => "Bluecoat - BCSI-AC-# cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /BCSI-AC-\d+=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "",
                :tags => ["Proxy"],
                :vendor => "Bluecoat",
                :product => "WebProxy",
                :website => "https://www.bluecoat.com/",
                :match_details => "Bluecoat - BCSI-ACP-# cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /BCSI-ACP-\d+=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
