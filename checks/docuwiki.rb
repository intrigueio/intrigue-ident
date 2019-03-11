module Intrigue
module Ident
module Check
class Docuwiki < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Docuwiki",
        :product => "Docuwiki",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /DokuWiki=/,
        :match_details =>"Cookie match",
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
