module Intrigue
  module Ident
    module Check
      module Private
        class AirOS < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["operating_system"],
                :vendor => "AirOS",
                :product => "AirOS",
                :website => "https://dl.ubnt.com/guides/airOS/airOS_UG.pdf",
                :match_details => "AirOS AirOS - AIROS_SESSIONID Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /AIROS_SESSIONID=/i,
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
