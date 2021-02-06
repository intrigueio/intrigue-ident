module Intrigue
    module Ident
    module Check
    module Private
    class Docfinity < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "DocFinity",
                :product => "DocFinity",
                :website => "https://www.docfinity.com/",
                :match_details =>"DocFinity",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ DocFinity\ Server$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "DocFinity",
                :product => "DocFinity",
                :website => "https://www.docfinity.com/",
                :match_details =>"DocFinity - title referece",
                :version => nil,
                :match_type => :content_title,
                :match_content =>  /^DocFinity\ Server$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "DocFinity",
                :product => "DocFinity",
                :website => "https://www.docfinity.com/",
                :match_details =>"DocFinity - page referece",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /DocFinity\ Server/i,
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