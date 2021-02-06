module Intrigue
    module Ident
    module Check
    module Private
    class SocialAndLoyal < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "CRM", "Social", "Advertising"],
                :vendor => "Social&Loyal",
                :product =>"Social&Loyal",
                :website => "https://www.socialandloyal.com/",
                :match_details =>"Social&Loyal - socialandloyal-session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /socialandloyal-session=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            }
        ]
        end
    end
    end
    end
    end
    end