module Intrigue
    module Ident
    module Check
    module Private
    class Dokeos < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["LMS"],
                :vendor => "Dokeos",
                :product => "Dokeos",
                :website => "https://www.dokeos.com/",
                :match_details =>"Dokeos - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by: Dokeos$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["LMS"],
                :vendor => "Dokeos",
                :product => "Dokeos",
                :website => "https://www.dokeos.com/",
                :references => ["https://www.exploit-db.com/exploits/3980"],
                :match_details =>"Dokeos - dk_sid cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /dk_sid=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["LMS"],
                :vendor => "Dokeos",
                :product => "Dokeos",
                :website => "https://www.dokeos.com/",
                :references => ["https://www.exploit-db.com/exploits/3980"],
                :match_details =>"Dokeos - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<meta\sname="Generator"\scontent="Dokeos"\s*\/?>/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["LMS"],
                :vendor => "Dokeos",
                :product => "Dokeos",
                :website => "https://www.dokeos.com/",
                :references => ["https://www.exploit-db.com/exploits/3980"],
                :match_details =>"Dokeos - page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<a href="https?:\/\/www\.dokeos\.com" target=".*">Dokeos (\d+(\.\d+)*)<\/a>/i,
                :dynamic_version => lambda {|x| 
                    version = _first_body_capture(x,/<a href="https?:\/\/www\.dokeos\.com" target=".*">Dokeos (\d+(\.\d+)*)<\/a>/i)
                    },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            }
        ]
        end
    end
    end
    end
    end
    end
    