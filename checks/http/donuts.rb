module Intrigue
  module Ident
    module Check
      module Private
        class Donuts < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Analytics", "Marketing", "Social"],
                :vendor => "Donuts",
                :product => "BL.INK",
                :website => "https://www.bl.ink/",
                :match_details => "Donuts BL.INK - BlinkSession Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /BlinkSession=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Analytics", "Marketing", "Social"],
                :vendor => "Donuts",
                :product => "BL.INK",
                :website => "https://www.bl.ink/",
                :match_details => "Donuts BL.INK - _bl_login_panel Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_bl_login_panel=/i,
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
