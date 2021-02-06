module Intrigue
  module Ident
    module Check
      class Tripalocal < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["Social"],
              :vendor => "Tripalocal",
              :product => "Tripalocal",
              :website => "http://tripalocal.com/",
              :match_details => "Tripalocal - Tripalocal_sessionid Cookie Match",
              :version => nil,
              :match_type => :content_cookies,
              :match_content => /Tripalocal_sessionid=/,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
          ]
        end
      end
    end
  end
end
