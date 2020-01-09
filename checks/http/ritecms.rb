module Intrigue
module Ident
module Check
class RiteCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "RiteCMS",
        :product => "RiteCMS",
        :references => ["http://ritecms.com/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /ritecms (.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /ritecms (.*.\d)/i)},
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
