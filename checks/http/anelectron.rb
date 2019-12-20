module Intrigue
module Ident
module Check
class Anelectron < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Anelectron",
        :product => "Advanced Electron Forum",
        :references => [],
        :version => nil,
        :match_type => :content_body,
        :match_content => /Powered By AEF (\d.*?)<\/a>/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /Powered By AEF (\d.*?)<\/a>/i)},
        :match_details => "powered by message",
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
