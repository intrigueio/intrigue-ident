module Intrigue
    module Ident
    module Check
    module Private
    class Boom < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "BOOM",
                :product => "MANA",
                :website => "http://manaandisheh.com/",
                :match_details =>"BOOM MANA - x-supplied-by header.",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-supplied-by: MANA$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "BOOM",
                :product => "MANA",
                :website => "http://manaandisheh.com/",
                :match_details =>"BOOM MANA - meta generator page reference.",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<meta name=.generator. content=.boom site builder.>/i,
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