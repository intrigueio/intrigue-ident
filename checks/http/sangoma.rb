module Intrigue
    module Ident
    module Check
    module Private
    class Sangoma < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["VoIP", "Communication"],
                :vendor => "Sangoma",
                :product => "Asterisk",
                :website => "https://www.asterisk.org/",
                :match_details => "Asterisk",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ Asterisk\/(\d+(\.\d+)*)$/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^server:\ Asterisk\/(\d+(\.\d+)*)$/i)
                    },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["VoIP", "Communication"],
                :vendor => "Sangoma",
                :product => "Asterisk",
                :website => "https://www.asterisk.org/",
                :match_details => "Asterisk - page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Asterisk\/(\d+(\.\d+)*)/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/Asterisk\/(\d+(\.\d+)*)/i)
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