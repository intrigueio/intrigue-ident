module Intrigue
module Ident
module Check
class ManageEngine < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => [""],
        :vendor =>"ManageEngine",
        :product =>"ServiceDesk Plus",
        :match_details =>"cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /SDPSESSIONID=/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
