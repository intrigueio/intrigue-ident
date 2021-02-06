module Intrigue
    module Ident
    module Check
    module Private
    class Ahoy < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "Ahoy",
                :product => "Ahoy",
                :website => "https://github.com/ankane/ahoy",
                :match_details =>"Ahoy - ahoy_track cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /ahoy_track/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "Ahoy",
                :product => "Ahoy",
                :website => "https://github.com/ankane/ahoy",
                :match_details =>"Ahoy - ahoy_visit cookie ",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /ahoy_visit/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "Ahoy",
                :product => "Ahoy",
                :website => "https://github.com/ankane/ahoy",
                :match_details =>"Ahoy - ahoy_visitor cookie ",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /ahoy_visitor/i,
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