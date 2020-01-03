module Intrigue
module Ident
module Check
class Squarespace < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS", "CMS"],
        :vendor => "Squarespace",
        :product => "Squarespace",
        :match_details => "server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^Server: Squarespace$/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
