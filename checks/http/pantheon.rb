module Intrigue
module Ident
module Check
class Pantheon < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS", "CMS"],
        :vendor => "Pantheon",
        :product => "Pantheon",
        :match_details => "x-pantheon-site header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /x-pantheon-site/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CMS", "SaaS"],
        :vendor =>"Pantheon",
        :product =>"Patheon",
        :match_details =>"styx hostname header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-pantheon-styx-hostname:/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CMS", "SaaS"],
        :vendor =>"Pantheon",
        :product =>"Patheon",
        :match_details =>"styx header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-styx-req-id:/i,
        :paths => ["#{url}"],
        :inference => false
      }

    ]
  end

end
end
end
end
