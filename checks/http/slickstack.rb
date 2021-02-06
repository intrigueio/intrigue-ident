module Intrigue
  module Ident
    module Check
      module Private
        class Slickstack < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "SlickStack",
                :product => "SlickStack",
                :website => "https://slickstack.io/",
                :match_details => "SlickStack - generator tag page reference",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /x-powered-by: SlickStack/i,
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
