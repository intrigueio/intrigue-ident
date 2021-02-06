module Intrigue
    module Ident
    module Check
    module Private
    class CampbellScientific < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Campbell Scientific",
                :product => "CSI Web Server",
                :website => "https://www.campbellsci.com/csiwebs",
                :match_details =>"Campbell Scientific CSI Web Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: CSI Web Server (\d+(.\d+))$/i,
                :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x, /^server: CSI Web Server (\d+(.\d+))$/i)
                },
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