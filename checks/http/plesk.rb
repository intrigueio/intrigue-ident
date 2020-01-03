module Intrigue
module Ident
module Check
class Plesk < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["COTS"],
        :vendor => "Plesk",
        :product =>"Plesk",
        :references => [],
        :match_details =>"x-powered-by-plesk... plesklin",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-powered-by: PleskLin/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["COTS"],
        :vendor => "Plesk",
        :product =>"Plesk",
        :references => [],
        :match_details =>"pleskwin in the header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^PleskWin/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["COTS"],
        :vendor => "Plesk",
        :product =>"Plesk",
        :references => [],
        :match_details =>"x-powered-by-plesk",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-powered-by-plesk:.*/,
        :paths => ["#{url}"],
        :inference => false
      },


    ]
  end

end
end
end
end
