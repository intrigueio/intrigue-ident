module Intrigue
module Ident
module Check
class RbsCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "RBS",
        :product => "RBS Change",
        :references => ["https://www.rbschange.fr/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /RBS Change (.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /RBS Change (.*.\d)/i)},
        :match_details => "header match",
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
