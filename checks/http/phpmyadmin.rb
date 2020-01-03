module Intrigue
module Ident
module Check
class PhpMyAdmin < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative","COTS"],
        :vendor => "PhpMyAdmin",
        :product => "PhpMyAdmin",
        :match_details => "PhpMyAdmin",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /phpMyAdmin=/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
