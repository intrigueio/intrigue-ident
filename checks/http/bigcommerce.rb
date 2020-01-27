module Intrigue
module Ident
module Check
class BigCommerce < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
=begin
      # Currently match_content too loose
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "bigcommerce",
        :product => "bigcommerce",
        :references => [],
        :version => nil,
        :match_type => :content_body,
        :match_content => /bigcommerce/i,
        :dynamic_version => nil,
        :match_details => "footer match",
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
=end 
    ]
  end

end
end
end
end
