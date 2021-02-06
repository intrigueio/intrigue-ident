module Intrigue
  module Ident
    module Check
      module Private
        class TMTown < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Networking"],
                :vendor => "TM-Town",
                :product => "TM-Town",
                :website => "https://www.tm-town.com/",
                :match_details => "TM-Town TM-Town  - _town_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_town_session=/i,
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
