module Intrigue
module Ident
module Check
class Sailpoint < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["IAM"],
        :vendor => "Sailpoint",
        :product => "IdentityQ",
        :references => [
          "https://www.sailpoint.com/identity-management-software-identityiq/"
        ],
        :match_details => "Main page of a sailpoint identityq instance",
        :version => nil,
        :match_type => :content_title,
        :match_content =>  /SailPoint IdentityIQ/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
