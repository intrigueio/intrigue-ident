module Intrigue
module Ident
module Check
class Sophos < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [          
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Security"],
        :vendor =>"Sophos",
        :product =>"Sophos",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^server: xxxx$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      ###
      ### Also fortinet?
      ###
      #{
      #  :type => "fingerprint",
      #  :category => "application",
      #  :tags => ["COTS", "Security"],
      #  :vendor =>"Sophos",
      #  :product =>"Sophos",
      #  :match_details =>"server header",
      #  :version => nil,
      #  :match_type => :content_headers,
      #  :match_content => /^server: xxxxxxxx-xxxxx$/i,
      #  :paths => ["#{url}"],
      #  :inference => false
      #}
    ]
  end

end
end
end
end
