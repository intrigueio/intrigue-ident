module Intrigue
module Ident
module Check
class ContesisCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Zengenti",
        :product => "Contensis CMS",
        :references => ["https://zengenti.com/en-gb"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /Contensis CMS Version (\d..\d)/,
        :dynamic_version => lambda { |x| _first_body_capture(x, /Contensis CMS Version (\d..\d)/)},
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
