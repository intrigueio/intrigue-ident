module Intrigue
module Ident
module Check
class ImpressPages < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "ImpressPages",
        :product => "ImpressPages",
        :references => ["https://www.impresspages.org/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /impresspages/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /impresspages (.*\d)/i)},
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
