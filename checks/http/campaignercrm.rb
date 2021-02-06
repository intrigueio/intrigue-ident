module Intrigue
  module Ident
    module Check
      module Private
        class CampaignerCRM < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CRM", "Marketing", "SaaS"],
                :vendor => "CampaignerCRM",
                :product => "CampaignerCRM",
                :website => "https://www.campaignercrm.com/",
                :match_details => "CampaignerCRM CampaignerCRM - MKTG_utm_source Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /MKTG_utm_source=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.campaignercrm.com/"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CRM", "Marketing", "SaaS"],
                :vendor => "CampaignerCRM",
                :product => "CampaignerCRM",
                :website => "https://www.campaignercrm.com/",
                :match_details => "CampaignerCRM CampaignerCRM - MKTG_from Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /MKTG_from=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.campaignercrm.com/"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CRM", "Marketing", "SaaS"],
                :vendor => "CampaignerCRM",
                :product => "CampaignerCRM",
                :website => "https://www.campaignercrm.com/",
                :match_details => "CampaignerCRM CampaignerCRM - MKTG_fv Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /MKTG_fv=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.campaignercrm.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
