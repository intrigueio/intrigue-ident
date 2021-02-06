module Intrigue
    module Ident
    module Check
    module Private
    class Chamilo < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Collaboration"],
                :vendor => "Chamilo",
                :product => "Chamilo LMS",
                :website => "http://www.chamilo.org/",
                :match_details => "Chamilo - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Chamilo/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^x-powered-by: Chamilo (\d+(\.\d+)*)$/i)
                    },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Collaboration"],
                :vendor => "Chamilo",
                :product => "Chamilo LMS",
                :website => "http://www.chamilo.org/",
                :match_details => "Chamilo - generator page refence",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name=.generator.\s*content=.Chamilo/i,
                :dynamic_version => lambda {|x| 
                        version = _first_body_capture(x,/<meta name=.generator.\s*content=.Chamilo (\d+(\.\d+)*)/i)
                    },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Collaboration"],
                :vendor => "Chamilo",
                :product => "Chamilo LMS",
                :website => "http://www.chamilo.org/",
                :match_details => "Chamilo - powered by page refence",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<a href=.+\s*target=._blank.\>\s*Powered by Chamilo\s*<\/a>/i,
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