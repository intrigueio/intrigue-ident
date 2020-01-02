module Intrigue
module Ident
module Check
class AlmubdaCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "AlMubda",
        :product => "Almubda CMS",
        :references => [],
        :version => nil,
        :match_type => :content_body,
        :match_content => /Powered by Al Mubda version (\d.*?)<\/a>/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /Powered by Al Mubda version (\d.*?)<\/a>/i)},
        :match_details => "footer match",
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
