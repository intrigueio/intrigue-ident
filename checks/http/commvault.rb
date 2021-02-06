module Intrigue
    module Ident
    module Check
    module Private
    class Commvault < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "commvault",
                :product => "commserve",
                :website => "http://developer.commvault.com/commvault/v11/article?p=1773.htm",
                :match_details =>"CommVault Web Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ Commvault\ WebServer$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "commvault",
                :product => "commserve",
                :website => "http://developer.commvault.com/commvault/v11/article?p=1773.htm",
                :match_details =>"CommVault - logo reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /class=\"vw\-commvault\-logo\"/i,
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