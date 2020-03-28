module Intrigue
module Ident
module Check
class Lastpass < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Security", "SaaS"],
        :vendor =>"Lastpass",
        :product =>"Lastpass",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: LastPass$/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
