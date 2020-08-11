
module Intrigue
module Ident
module Check
class Readmeio < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Javascript", "SaaS", "Support"],
        :vendor =>"Readme.io",
        :product =>"Readme.io",
        :match_details =>"js load string",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /cdn.readme.io\/js\/bundle-hub2.js/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS", "API"],
        :vendor =>"Readme.io",
        :product =>"Readme.io",
        :match_details =>"readme.io api manager",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /\.hub-api \.api-definition/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end