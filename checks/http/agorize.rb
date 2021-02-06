module Intrigue
  module Ident
    module Check
      module Private
        class Agorize < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Agorize",
                :product => "Agorize",
                :website => "https://www.agorize.com/en",
                :match_details => "Agorize Agorize - _agorize_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_agorize_session=/i,
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
