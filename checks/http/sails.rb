module Intrigue
    module Ident
    module Check
    module Private
    class Sails < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "The Sails Company",
                :product => "Sails",
                :website => "https://sailsjs.com/",
                :match_details =>"Sails",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by:\ Sails\ \<?sailsjs\.org\>?$/i,
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