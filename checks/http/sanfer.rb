module Intrigue
  module Ident
    module Check
      module Private
        class Sanfer < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Health", "E-Commerce"],
                :vendor => "Sanfer",
                :product => "Vademecum",
                :website => "https://vademecum.sanfer.com.mx/",
                :match_details => "Sanfer Vademecum - vademecum_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /vademecum_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Health", "E-Commerce"],
                :vendor => "Sanfer",
                :product => "XYZ",
                :website => "https://sanfer.xyz/",
                :match_details => "Sanfer XYZ - sanfer_desarrollo_de_apps_portales_web_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /sanfer_desarrollo_de_apps_portales_web_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Health", "E-Commerce"],
                :vendor => "Sanfer",
                :product => "XYZ",
                :website => "https://sanfer.xyz/",
                :match_details => "Sanfer XYZ - laboratorios_sanfer_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /laboratorios_sanfer_session=/i,
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
