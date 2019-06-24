module Intrigue
module Ident
module Check
class Centos < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      { ## Infer from apache title...
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Centos",
        :product => "Centos",
        :references => [],
        :version => nil,
        :match_type => :content_title,
        :match_content => /^Apache HTTP Server Test Page powered by CentOS$/i,
        :match_details => "apache server default page",
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
