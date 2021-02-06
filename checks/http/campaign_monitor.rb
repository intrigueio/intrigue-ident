module Intrigue
    module Ident
    module Check
    module Private
    class CampaignMonitor < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Marketing", "SaaS"],
                :vendor => "Campaign Monitor",
                :product => "Create Send",
                :website => "https://www.campaignmonitor.com/",
                :match_details =>"Campaign Monitor Create Send - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: csw$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Marketing", "SaaS"],
                :vendor => "Campaign Monitor",
                :product => "Create Send",
                :website => "https://www.campaignmonitor.com/",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /cs_siftsession=/,
                :match_details => "Campaign Monitor Create Send - Cookie Match",
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
              },
        ]
        end
    end
    end
    end
    end
    end