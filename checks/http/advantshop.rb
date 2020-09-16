module Intrigue
module Ident
module Check
class Advantshop < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
=begin

      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Advantshop",
        :product => "Advantshop",
        :references => ["https://www.advantshop.net/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /AdVantShop.NET/i,
        :dynamic_version => lambda { |x|  _first_body_capture(x, /AdVantShop.NET (  )/i)},
        :match_details => "header match",
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
=end
    ]
  end

end
end
end
end
