module Intrigue
module Ident
module Check
class Lcn < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Hosting","CDN"],
        :vendor =>"LCN",
        :product =>"LCN",
        :match_details =>"body error message",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /This website is temporarily offline - LCN.com/,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
