module Intrigue
module Ident
module Check
class CMSimple < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "CMSimple",
        :product => "CMSimple",
        :references => ["https://www.cmsimple.fr/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /CMSimple [\d\.]+/i,
        :dynamic_version => lambda { |x|  _first_body_capture(x, /CMSimple ([\d\.]+)/i)},
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
