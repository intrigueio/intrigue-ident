module Intrigue
    module Ident
    module Check
    module Private
    class Dokuwiki < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dokuwiki",
                :product => "Dokuwiki",
                :website => "https://www.dokuwiki.org/",
                :match_details =>"Dokuwiki - generator page reference.",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<meta name="generator" content="DokuWiki.*"/i,
                :dynamic_version => lambda {|x| 
                    version = _first_body_capture(x,/<meta name="generator" content="DokuWiki Release ((\d+(\-\d+)*)\w*)"/i)
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
    