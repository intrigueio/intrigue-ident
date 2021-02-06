module Intrigue
  module Ident
    module Check
      class Fluxx < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "service",
              :tags => ["SaaS", "E-Commerce", "Security", "Social"],
              :vendor => "Trustly",
              :product => "Trustly",
              :website => "https://trustly.com/en",
              :match_details => "Trustly - _tpc_persistance_cookie Cookie Match",
              :version => nil,
              :match_type => :content_cookies,
              :match_content => /_tpc_persistance_cookie=/,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
          ]
        end
      end
    end
  end
end
