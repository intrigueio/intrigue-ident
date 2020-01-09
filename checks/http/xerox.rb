module Intrigue
module Ident
module Check
class Xerox < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Embedded","Printer"],
        :vendor => "Xerox",
        :product => "WorkCentre Printer",
        :references => [],
        :match_details =>"title",
        :match_type => :content_title,
        :match_content => /CentreWare Internet Services/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
