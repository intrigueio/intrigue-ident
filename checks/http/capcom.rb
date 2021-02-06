module Intrigue
  module Ident
    module Check
      module Private
        class Capcom < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Entertainment"],
                :vendor => "Capcom",
                :product => "Capcom",
                :website => "http://www.capcom.com/",
                :match_details => "Capcom Capcom - capcom=Session= Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /capcom=Session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.e-capcom.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Entertainment"],
                :vendor => "Capcom",
                :product => "Resident Evil",
                :website => "http://www.capcom.com/",
                :match_details => "Capcom Resident Evil - renet_rev_application_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /renet_rev_application_id=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.residentevil.net:443"],
              },
            ]
          end
        end
      end
    end
  end
end
