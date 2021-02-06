module Intrigue
  module Ident
    module Check
      module Private
        class TM3Software < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "TM3 Software",
                :product => "TM3 Software",
                :website => "http://www.tm3-software.de/",
                :match_details => "TM3 Software - _tm3_software_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_tm3_software_session=/,
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
