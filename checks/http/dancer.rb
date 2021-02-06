module Intrigue
    module Ident
    module Check
    module Private
    class Dancer < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Dancer",
                :product => "PerlDancer",
                :website => "http://perldancer.org/",
                :match_details =>"PerlDancer - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Perl Dancer/i,
                :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: Perl Dancer (\d+(\.\d+)*)$/i)
                },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Dancer",
                :product => "PerlDancer",
                :website => "http://perldancer.org/",
                :match_details =>"PerlDancer - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by: Perl Dancer/i,
                :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^x-powered-by: Perl Dancer (\d+(\.\d+)*)$/i)
                },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Dancer",
                :product => "PerlDancer",
                :website => "http://perldancer.org/",
                :match_details =>"PerlDancer - dancer\.session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /dancer\.session=/i,
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
    