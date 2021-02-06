module Intrigue
    module Ident
    module Check
    module Private
    class Twilightcms < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "TwilightCMS",
                :product => "Twilight CMS",
                :website => "http://www.twilightcms.com/",
                :match_details =>"Twilight CMS - X-Powered-CMS header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^X-Powered-CMS: Twilight CMS$/i,
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
    