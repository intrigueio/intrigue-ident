module Intrigue
    module Ident
    module Check
    module Private
    class Aerohive < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Network", "Management"],
                :vendor => "Aerohive",
                :product => "HiveManager",
                :website => "https://www.aerohiveworks.com/HiveManager-Online.asp",
                :match_details =>"Aerohive HiveManager - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ HiveManager$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Network", "Management"],
                :vendor => "Aerohive",
                :product => "HiveManager",
                :website => "https://www.aerohiveworks.com/HiveManager-Online.asp",
                :match_details =>"Aerohive HiveManager - MyHive Login page title reference.",
                :version => nil,
                :match_type => :content_title,
                :match_content =>  /^MyHive \| Login$/i,
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