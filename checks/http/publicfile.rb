module Intrigue
  module Ident
  module Check
  class Publicfile < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["WebServer", "FTPServer"],
          :vendor =>"Publicfile",
          :product =>"Publicfile",
          :match_details => "server header",
          :match_type => :content_headers,
          :website => "https://cr.yp.to/publicfile.html",
          :match_content =>  /^server: publicfile$/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  