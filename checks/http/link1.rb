module Intrigue
module Ident
module Check
class Link1 < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Embedded","Networking"],
        :references => [
          "http://www.tecwi.com.br/manual/link-one/L1-RW333.pdf"
        ],
        :vendor => "Link1",
        :product =>"Wireless N300",
        :match_details =>"title",
        :match_type => :content_title,
        :version => nil,
        :match_content =>  /Wireless N300 Home Router/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :credentials => [{:user => "admin", :password => ""}],
        :inference => false
      }
    ]
  end

end
end
end
end
