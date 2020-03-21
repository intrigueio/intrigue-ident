module Intrigue
module Ident
module Check
class Lithium < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["SaaS", "CMS"],
        :vendor => "Lithium",
        :product =>"Lithium",
        :references => [
          "https://community.khoros.com/t5/Khoros-Community-Discussions/On-Premise-Hosting/td-p/213256"
        ],
        :match_details =>"Lithium Community Management",
        :match_type => :content_cookies,
        :version => nil,
        :match_content =>  /LithiumVisitor/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["SaaS", "CMS"],
        :vendor => "Lithium",
        :product =>"Lithium",
        :match_details =>"Lithium Community Management",
        :match_type => :content_cookies,
        :version => nil,
        :match_content =>  /LiSESSIONID/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
