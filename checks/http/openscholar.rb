module Intrigue
module Ident
module Check
class OpenScholar < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor =>"OpenScholar",
        :product =>"OpenScholar",
        :match_details =>"x-powered-by header",
        :version => nil,
        :match_type => :content_header,
        :match_content =>  /x-powered-by: OpenScholar/i,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
