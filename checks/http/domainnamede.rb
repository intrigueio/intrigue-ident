module Intrigue
module Ident
module Check
module Private
class Domainnamede < Intrigue::Ident::Check::Base

def generate_checks(url)
  [
	{
	  :type => "fingerprint",
	  :category => "service",
	  :tags => ["Parked"],
	  :vendor => "domainname.de",
	  :product => "domainname.de",
	  :website => "https://domainname.de",
	  :references => [],
	  :version => nil,
	  :match_type => :content_body,
	  :match_content => /Diese Domain steht ZUM VERKAUF/i,
	  :match_details => "body",
	  :hide => false,
	  :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
	  :inference => false
	}
  ]
end

end
end
end
end
end

