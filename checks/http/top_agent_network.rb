module Intrigue
  module Ident
    module Check
      module Private
        class TopAgentNetwork < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Top Agent Network",
                :product => "Top Agent Network",
                :website => "http://www.topagentnetwork.com/",
                :match_details => "Top Agent Network - _tan_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_tan_session=/,
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
