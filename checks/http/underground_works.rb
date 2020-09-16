module Intrigue
module Ident
module Check
class UndergroundWorks < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development"],
        :vendor => "Underground Works",
        :website => "https://underground.works/clockwork/",
        :product => "Clockwork",
        :references => ["https://github.com/itsgoingd/clockwork"],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /X-Clockwork-Id:.*$/i,
        :match_details => "unique header match",
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false,
        :issue => "exposed_debugging_interface"
      }
    ]
  end

end
end
end
end
