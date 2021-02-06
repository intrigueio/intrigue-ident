module Intrigue
    module Ident
    module Check
    module Private
    class Abgvoice < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "ABGVoice",
                :product => "Web ABGVoice",
                :website => "https://www.Abgvoice.com/en/home",
                :match_details => "ABGVoice Web Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ ABGVoice\/(\d+(\.\d+)*)$/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^server:\ ABGVoice\/(\d+(\.\d+)*)$/i)
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