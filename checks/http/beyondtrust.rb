module Intrigue
    module Ident
    module Check
    module Private
    class BeyondTrust < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Administrative", "COTS"],
                :vendor => "BeyondTrust Corporation",
                :product => "Secure Remote Access",
                :website => "https://www.beyondtrust.com/solutions#secure-remote-access",
                :match_details =>"BeyondTrust Secure Remote Access.",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ Bomgar$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Administrative", "COTS"],
                :vendor => "BeyondTrust Corporation",
                :product => "Secure Remote Access",
                :website => "https://www.beyondtrust.com/solutions#secure-remote-access",
                :match_details =>"BeyondTrust Secure Remote Access - Bomgar copyright reference.",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /Copyright.+\d{4}-\d{4}\ Bomgar\ Corporation\.\ Redistribution\ Prohibited\.\ All\ Rights\ Reserved\./i,
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