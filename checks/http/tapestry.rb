module Intrigue
    module Ident
    module Check
    module Private
    class Tapestry < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "Tapestry",
                :product => "Tapestry",
                :website => "https://www.tapestry.net/",
                :version => nil,
                :match_type => :content_cookies,
                :match_details =>"Tapestry - _SWOS-tapauth_session Cookie Match",
                :match_content =>  /_SWOS-tapauth_session=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "Tapestry",
                :product => "Tapestry",
                :website => "https://www.tapestry.net/",
                :version => nil,
                :match_type => :content_cookies,
                :match_details =>"Tapestry - _tapestry-backend_session Cookie Match",
                :match_content =>  /_tapestry-backend_session=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "Tapestry",
                :product => "Tapestry",
                :website => "https://www.tapestry.net/",
                :version => nil,
                :match_type => :content_cookies,
                :match_details =>"Tapestry - _geomobile-database_session Cookie Match",
                :match_content =>  /_geomobile-database_session=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "Tapestry",
                :product => "Tapestry",
                :website => "https://www.tapestry.net/",
                :version => nil,
                :match_type => :content_cookies,
                :match_details =>"Tapestry - _golden-commerce_session Cookie Match",
                :match_content =>  /_golden-commerce_session=/,
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