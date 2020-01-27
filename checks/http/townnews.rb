module Intrigue
module Ident
module Check
class TownNews < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
=begin     
      # Currently match_content too loose, also no point in inference if we dont' have a version
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "TownNews",
        :product => "BLOX CMS",
        :references => ["https://townnews.com/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /BLOX Content Management System/i,
        :dynamic_version => nil,
        :match_details => "footer match",
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
=ends
    ]
  end

end
end
end
end
