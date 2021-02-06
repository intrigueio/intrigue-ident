module Intrigue
    module Ident
    module Check
    module Private
    class DGLogik < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "DGLogik, Inc",
                :product => "DGLux Server.",
                :website => "http://wiki.dglogik.com/dglux5_wiki:home",
                :match_details =>"DGLux Web Server",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ dglux_server\/\d+$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "DGLogik, Inc",
                :product => "DGLux Server.",
                :website => "http://wiki.dglogik.com/dglux5_wiki:home",
                :match_details =>"DGLux Web Server - Login page title reference",
                :version => nil,
                :match_type => :content_title,
                :match_content =>  /^Login - DGLux5$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "DGLogik, Inc",
                :product => "DGLux Server.",
                :website => "http://wiki.dglogik.com/dglux5_wiki:home",
                :match_details =>"DGLux Web Server - page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /DGLux5\ (r(\d+(\.\d+)*))/i,
                :dynamic_version => lambda {|x| 
                    version = _first_body_capture(x,/DGLux5\ (r(\d+(\.\d+)*))/i)
                },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            }
        ]
        end
    end
    end
    end
    end
    end