module Intrigue
  module Ident
    module Check
      module Private
        class CTCorp < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "CT Corp",
                :product => "FemaleDaily Network",
                :website => "http://www.femaledaily.com/",
                :match_details => "CT Corp FemaleDaily Network - fdbr_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /fdbr_session=/,
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
