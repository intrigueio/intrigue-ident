module Intrigue
  module Ident
    module Check
      module Private
        class Cleverbridge < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce", "Cloud", "SaaS"],
                :vendor => "cleverbridge",
                :product => "cleverbridge",
                :website => "http://www.cleverbridge.com/",
                :match_details => "cleverbridge cleverbridge - cbsession2 Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /cbsession2=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce", "Cloud", "SaaS"],
                :vendor => "cleverbridge",
                :product => "cleverbridge",
                :website => "http://www.cleverbridge.com/",
                :match_details => "cleverbridge cleverbridge - cb_locale Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /cb_locale=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce", "Cloud", "SaaS"],
                :vendor => "cleverbridge",
                :product => "cleverbridge",
                :website => "http://www.cleverbridge.com/",
                :match_details => "cleverbridge cleverbridge - cb_currency Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /cb_currency=/,
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
