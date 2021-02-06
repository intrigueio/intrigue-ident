module Intrigue
    module Ident
    module Check
    module Private
    class Amber < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Amber",
                :product => "Amber",
                :website => "https://amberframework.org/",
                :match_details =>"Amber - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by: Amber$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Amber",
                :product => "Amber",
                :website => "https://amberframework.org/",
                :match_details =>"Amber - amber\.session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /amber\.session=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Amber",
                :product => "Amber",
                :website => "https://amberframework.org/",
                :match_details =>"Amber - built using page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /Built using\s*<a href="https?:\/\/amberframework\.org\/">Amber/i,
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
    