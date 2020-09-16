module Intrigue
module Ident
module Check
class InnovativeInterfacesInc < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CMS"],
        :vendor => "Innovative Interfaces Inc",
        :product => "III 100",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: III 100/,
        :match_details =>"server header",
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end
  
end
end
end
end
