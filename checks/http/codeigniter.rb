module Intrigue
module Ident
module Check
class CodeIgniter < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer","Embedded"],
        :vendor => "CodeIgniter",
        :product => "CodeIgniter",
        :version => nil,
        :match_type => :content_title,
        :match_content =>  /Welcome to CodeIgniter/,
        :match_details =>"page title",
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end
end
end
end
end
