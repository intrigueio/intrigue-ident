module Intrigue
    module Ident
    module Check
    module Private
    class Craftcms < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "CraftCMS",
                :product => "Craft CMS",
                :website => "https://craftcms.com/",
                :match_details => "CraftCMS - CraftSessionId cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /CraftSessionId=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Craft",
                :product => "Craft Commerce",
                :website => "https://craftcommerce.com/",
                :match_details => "CraftCMS - powered by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Craft Commerce/i,
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