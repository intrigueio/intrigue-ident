module Intrigue
module Ident
module Check
class Dokuwiki < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Dokuwiki",
        :product => "Dokuwiki",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /DokuWiki=/,
        :match_details =>"Dokuwiki - DokuWiki cookie",
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end
  
end
end
end
end
