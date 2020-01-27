module Intrigue
module Ident
module Check
class NetObjects < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "NetObjects Inc.",
        :product => "Koken",
        :references => ["http://koken.me/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /koken ([\d\.]+)/i ,
        :dynamic_version => lambda { |x| _first_body_capture(x, /koken ([\d\.]+)/i)},
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
