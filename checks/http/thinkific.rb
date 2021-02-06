module Intrigue
  module Ident
    module Check
      module Private
        class Thinkific < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "E-Commerce", "Education"],
                :vendor => "Thinkific",
                :product => "Thinkific",
                :website => "http://thinkific.com/",
                :match_details => "Thinkific Thinkific - _thinkific_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_thinkific_session=/,
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
