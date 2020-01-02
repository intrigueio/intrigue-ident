module Intrigue
module Ident
module Check
class ShopFactoryCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "ShopFactory",
        :product => "ShopFactory",
        :references => [],
        :version => nil,
        :match_type => :content_body,
        :match_content => /ShopFA(.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /V(.\d)/)},
        :match_details => "Header match",
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
