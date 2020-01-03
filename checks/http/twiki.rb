module Intrigue
module Ident
module Check
class Twiki < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS"],
        :vendor => "Twiki",
        :product =>"Twiki",
        :match_details =>"",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /TWIKISID/,
        :paths => ["#{url}"],
        :inference => true
      },
    ]
  end

end
end
end
end
