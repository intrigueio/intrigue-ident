module Intrigue
module Ident
module Check
class CharityEngine < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CRM"],
        :vendor => "CharityEngine",
        :product => "CharityEngine",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /title=\"Powered By CharityEngine\">/i,
        :match_details =>"unique body string",
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
