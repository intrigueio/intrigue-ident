module Intrigue
module Ident
module Check
class Axios < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Javascript"],
        :vendor => "Axios",
        :product => "Axios",
        :references => [],
        :version => nil,
        :match_type => :content_body,
        :match_content => /axios\.min\.js[\"|\']\>/i,
        :match_details => "filename",
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
