module Intrigue
module Ident
module Check
class Bigcartel < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "BigCartel",
        :product => "BigCartel",
        :references => ["https://www.bigcartel.com/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /Big Cartel/i,
        :dynamic_version => nil,
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
