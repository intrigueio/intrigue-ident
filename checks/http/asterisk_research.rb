module Intrigue
    module Ident
    module Check
    module Private
    class Asterisk < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Security"],
                :vendor => "Asterisk Research, Inc",
                :product => "On-Demand Penetration Testing",
                :website => "https://www.asteriskresearch.com/",
                :match_details => "Asterisk On-Demand Penetration Testing - title reference",
                :version => nil,
                :match_type => :content_title,
                :match_content => /Asterisk\ On-Demand\ Penetration\ Testing/i,
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