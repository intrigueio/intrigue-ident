module Intrigue
module Ident
module Check
class Bitly < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Marketing", "Hosting"],
        :vendor => "Bitly",
        :product =>"Bitly",
        :match_details =>"bitly cookie",
        :match_type => :content_cookies,
        :version => nil,
        :match_content =>  /Domain=bitly.com;/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Marketing", "Hosting"],
        :vendor => "Bitly",
        :product =>"Bitly",
        :match_details =>"bitly title - branded short domain",
        :match_type => :content_title,
        :version => nil,
        :hide => true, # dynamic hide only on ip access?
        :match_content =>  /Branded Short Domain Powered by Bitly/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Marketing", "Hosting"],
        :vendor => "Bitly",
        :product =>"Bitly",
        :match_details =>"bitly title - custom domain",
        :match_type => :content_title,
        :version => nil,
        :hide => true, # dynamic hide only on ip access?
        :match_content =>  /Custom Domain by Bitly/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }

    ]
  end

end
end
end
end
