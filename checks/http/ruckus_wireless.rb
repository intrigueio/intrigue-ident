module Intrigue
module Ident
module Check
class RuckusWireless < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Networking", "COTS", "Administrative"],
        :vendor =>"Ruckus Wireless",
        :product =>"Admin",
        :match_details =>"login page for ruckus wireless device",
        :match_type => :content_title,
        :match_content =>  /Ruckus Wireless Admin/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
