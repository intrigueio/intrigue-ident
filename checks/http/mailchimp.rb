module Intrigue
module Ident
module Check
class Mailchimp < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Marketing", "SaaS"],
        :vendor => "Mailchimp",
        :product =>"Mandrill",
        :match_details =>"login page",
        :match_type => :content_title,
        :version => nil,
        :match_content =>  /Log in to Mandrill/i,
        :paths => ["#{url}"], 
        :inference => false
      }
    ]
  end

end
end
end
end
