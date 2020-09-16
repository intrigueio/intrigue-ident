module Intrigue
module Ident
module Check
class Soha < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [          
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["VPN"],
        :vendor =>"Soha",
        :product =>"Soha",
        :match_details =>"x-spx-status header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^x-spx-status: \d+$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["VPN"],
        :vendor =>"Soha",
        :product =>"Soha",
        :match_details =>"x-spx-login-server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^x-spx-login-server: .*$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["VPN"],
        :vendor =>"Soha",
        :product =>"Soha",
        :match_details =>"x-spx-auth-supported header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^x-spx-auth-supported: .*$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["VPN"],
        :vendor =>"Soha",
        :product =>"Soha",
        :match_details =>"x-spx-auth-token-hdr header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^x-spx-auth-token-hdr: .*$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
