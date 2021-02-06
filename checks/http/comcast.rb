module Intrigue
  module Ident
    module Check
      module Private
        class Comcast < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Marketing"],
                :vendor => "Comcast",
                :product => "Visible World",
                :website => "http://www.visibleworld.com/",
                :match_details => "Comcast Visible World - visiwebSession Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /visiwebSession=/i,
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
