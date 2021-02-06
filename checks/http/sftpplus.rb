module Intrigue
    module Ident
    module Check
    module Private
    class Sftpplus < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["FTPServer"],
                :vendor => "SFTPPlus",
                :product => "SFTPPlus",
                :website => "https://www.sftpplus.com/",
                :match_details =>"SFTPPlus - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: SFTPPlus$/i,
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