module Intrigue
    module Ident
    module Check
    module Private
    class CardConnect < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "CardConnect",
                :product => "CardConnect",
                :website => "https://cardconnect.com/",
                :match_details =>"CardConnect - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: CardConnect$/i,
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