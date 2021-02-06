module Intrigue
  module Ident
    module Check
      module Private
        class Cloudera < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Analytics", "Cloud", "PaaS"],
                :vendor => "Cloudera",
                :product => "Cloudera",
                :website => "https://www.cloudera.com/",
                :match_details => "Cloudera - CLOUDERA_MANAGER_SESSIONID Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /CLOUDERA_MANAGER_SESSIONID=/,
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
