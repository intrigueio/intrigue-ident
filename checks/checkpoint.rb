module Intrigue
module Ident
module Check
  class Checkpoint < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "application",
          :vendor => "Checkpoint",
          :tags => ["vpn"],
          :product =>"GO",
          :match_details =>"page title",
          :references => ["https://en.wikipedia.org/wiki/Check_Point_GO"],
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /<title>Check Point Mobile GO/i,
          :paths => ["#{url}"]
        },
        {
          :type => "application",
          :vendor => "Checkpoint",
          :tags => ["vpn"],
          :product =>"GO",
          :match_details =>"server header",
          :references => ["https://en.wikipedia.org/wiki/Check_Point_GO"],
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /server: CPWS/i,
          :paths => ["#{url}"]
        },
        {
          :type => "application",
          :vendor => "Checkpoint",
          :tags => ["vpn"],
          :product =>"SSL Network Extender",
          :match_details =>"server header",
          :references => [],
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /server: Check Point SVN foundation/i,
          :paths => ["#{url}"]
        }
      ]
    end
  end
end
end
end
