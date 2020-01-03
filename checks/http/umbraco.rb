module Intrigue
module Ident
module Check
class Umbraco < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Umbraco",
        :product => "Umbraco",
        :references => ["https://umbraco.com/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /umbraco/,
        :match_details => "body match",
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end
  
end
end
end
end
