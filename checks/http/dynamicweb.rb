module Intrigue
module Ident
module Check
class DynamicWeb < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Dynamicweb",
        :product => "Dynamicweb",
        :references => ["https://www.dynamicweb.com/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /Dynamicweb (.*\d)/,
        :dynamic_version => lambda { |x| _first_body_capture(x, /Dynamicweb (.*\d)/)},
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
