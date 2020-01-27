module Intrigue
module Ident
module Check
class Discuz < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Discuz!",
        :product => "Discuz!",
        :references => ["http://www.discuz.net/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /discuz! [\d\.]+/i,
        :dynamic_version => lambda { |x|  _first_body_capture(x, /discuz! ([\d\.]+)/i)},
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
