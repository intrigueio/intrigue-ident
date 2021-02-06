module Intrigue
  module Ident
    module Check
      module Private
        class Syntellis < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Analytics"],
                :vendor => "Syntellis",
                :product => "Axiom",
                :website => "https://www.axiomsoftware.eu/en/",
                :match_details => "Syntellis Axiom - .AxiomWebClientSessionId cookie",
                :match_type => :content_cookies,
                :match_content => /\.AxiomWebClientSessionId=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://104.214.96.71/home/login?ReturnUrl=%2f"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Analytics"],
                :vendor => "Syntellis",
                :product => "Axiom",
                :website => "https://www.axiomsoftware.eu/en/",
                :match_details => "Syntellis Axiom - .AxAppServerTarget cookie",
                :match_type => :content_cookies,
                :match_content => /\.AxAppServerTarget=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://104.214.96.71/home/login?ReturnUrl=%2f"],
              },
            ]
          end
        end
      end
    end
  end
end
