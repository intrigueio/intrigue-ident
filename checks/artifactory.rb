module Intrigue
module Ident
module Check
class Artifactory < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS","CMS"],
        :vendor => "Innovative Interfaces Inc",
        :product => "III",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: III 100/,
        :match_details =>"server header",
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
