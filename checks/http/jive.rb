module Intrigue
module Ident
module Check
class Jive < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CMS"],
        :vendor => "Jive",
        :product =>"Platform",
        :website => "http://www.jivesoftware.com/",
        :match_details =>"jive login page",
        :match_type => :content_cookies,
        :version => nil,
        :match_content =>  /jive.login.ts=/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end
  
end
end
end
end
