module Intrigue
module Ident
module Check
  class Dyn < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting"],
          :vendor => "Dyn",
          :product =>"Dns",
          :match_details =>"dynect.net cookie",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /Domain=.dynect.net/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        }, 
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting"],
          :vendor => "Dyn",
          :product =>"Dns",
          :match_details =>"default login page",
          :version => nil,
          :match_type => :content_title,
          :match_content =>  /^Login | Dyn Portal$/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false,
          :hide => true
        }
      ]
    end

  end
end
end
end
