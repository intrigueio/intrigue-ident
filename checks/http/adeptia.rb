module Intrigue
module Ident
module Check
class Adeptia < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS"],
        :vendor => "Adeptia",
        :product => "Connect",
        :references => ["https://adeptia.com/products/Adeptia-Connect-enterprise-integration"],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /server: Adeptia/i,
        :match_details => "header match",
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false  
      }
    ]
  end


end
end
end
end
