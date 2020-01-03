
module Intrigue
module Ident
module Check
class Tridium < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative", "Networking"],
        :vendor =>"Tridium",
        :product =>"Niagara",
        :match_details =>"cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /niagara_session=/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
