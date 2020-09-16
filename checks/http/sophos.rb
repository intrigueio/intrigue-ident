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
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Security", "VPN"],
        :vendor =>"Sophos",
        :product =>"UTM",
        :match_details =>"devuce configuration - unique string",
        :version => nil,
        :match_type => :content_body,
        :match_content => /The device and all user certificates will be regenerated with the new signing CA. This may break current Site-to-Site VPN and Roadwarrior connections/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
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
      #  :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      #  :inference => false
      #}
    ]
  end

end
end
end
end
