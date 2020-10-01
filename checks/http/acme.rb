module Intrigue
module Ident
module Check
class Acme < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer"],
        :vendor => "Acme",
        :product => "Micro Httpd",
        :references => [ "https://acme.com/software/micro_httpd/" ],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /server: micro_httpd/i,
        :match_details => "server header",
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
