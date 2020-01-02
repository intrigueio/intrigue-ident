module Intrigue
module Ident
module Check
class Concrete5CMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Concrete5",
        :product => "Concrete5",
        :references => ["https://www.concrete5.org/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /concrete5 - (.*\d)/,
        :dynamic_version => lambda { |x| _first_body_capture(x, /concrete5 - (.*\d)/)},
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
