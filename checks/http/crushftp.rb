module Intrigue
  module Ident
    module Check
      module Private
        class Crushftp < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["FTPServer"],
                :vendor => "CrushFTP",
                :product => "CrushFTP",
                :website => "https://www.crushftp.com/index.html",
                :match_details => "CrushFTP Server header.",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: CrushFTP HTTP Server$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["FTPServer"],
                :vendor => "CrushFTP",
                :product => "CrushFTP",
                :website => "https://www.crushftp.com/index.html",
                :match_details => "CrushFTP WebInterface title.",
                :version => nil,
                :match_type => :content_title,
                :match_content => /CrushFTP WebInterface$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,

              },
            ]
          end
        end
      end
    end
  end
end
