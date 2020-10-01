module Intrigue
module Ident
module Check
class Centos < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      { ## Infer from apache title...
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer"],
        :vendor => "Centos",
        :product => "Centos",
        :references => [],
        :version => nil,
        :match_type => :content_title,
        :match_content => /^Apache HTTP Server Test Page powered by CentOS$/i,
        :match_details => "apache server default page",
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      { 
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative"],
        :vendor => "Centos",
        :product => "CentOS Web Panel",
        :references => [],
        :version => nil,
        :website => "http://centos-webpanel.com/",
        :match_type => :content_headers,
        :match_content => /^Server: cwpsrv$/i,
        :match_details => "centos web panel server header",
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false,
        :issue => "exposed_admin_panel_unauthenticated"
      }
    ]
  end
end
end
end
end
