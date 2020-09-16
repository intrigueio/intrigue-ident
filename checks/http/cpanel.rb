module Intrigue
module Ident
module Check
class Cpanel < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS","Hosting","Administrative"],
        :vendor => "cPanel",
        :product =>"cPanel",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /server: cPanel/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ], 
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS","Hosting","Administrative"],
        :vendor => "cPanel",
        :product =>"cPanel Hosted - Missing Page",
        :match_details =>"cPanel Hosted, but either misconfigured, or accessed via ip vs hostname?",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /URL=\/cgi-sys\/defaultwebpage.cgi/,
        :hide => true,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ], 
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS","Administrative"],
        :vendor => "cPanel",
        :product =>"cPanel - Not configured",
        :match_details =>"cPanel - not yet configured",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /href=\"\/cpanel\"\>log in<\/a> to launch this site/,
        :hide => true,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :examples => ['href="/cpanel">log in</a> to launch this site'], 
        :inference => false
      }
    ]
  end

end
end
end
end
