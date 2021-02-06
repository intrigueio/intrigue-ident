module Intrigue
  module Ident
    module Check
      module Private
        class Cimpress < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["IoT"],
                :vendor => "Cimpress",
                :product => "druck.at",
                :website => "https://www.druck.at/",
                :match_details => "Cimpress druck.at - dru_c Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /dru_c=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.druck.de:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["IoT"],
                :vendor => "Cimpress",
                :product => "VistaPrint",
                :website => "https://www.vistaprint.co.uk/",
                :match_details => "Cimpress VistaPrint - ppvp_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /ppvp_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://promo.vistaprint.at:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["IoT"],
                :vendor => "Cimpress",
                :product => "PrintBox",
                :website => "https://www.printbox-commande.fr/",
                :match_details => "Cimpress PrintBox - printbox-commande_ams Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /printbox-commande_ams=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://printbox-commande.fr:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["IoT"],
                :vendor => "Cimpress",
                :product => "PrintBox",
                :website => "https://www.printbox-commande.fr/",
                :match_details => "Cimpress PrintBox - printbox-client_ams Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /printbox-client_ams=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://printbox-client.fr:443"],
              },
            ]
          end
        end
      end
    end
  end
end
