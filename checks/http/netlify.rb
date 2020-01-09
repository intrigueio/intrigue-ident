module Intrigue
module Ident
module Check
class Netlify < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["PaaS"],
        :vendor => "Netlify",
        :product =>"Netlify",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: Netlify/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["PaaS"],
        :vendor => "Netlify",
        :product =>"Netlify",
        :match_details =>"x-nf-request-id header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-nf-request-id:.*$/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
