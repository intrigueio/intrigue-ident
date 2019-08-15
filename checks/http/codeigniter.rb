module Intrigue
module Ident
module Check
class CodeIgniter < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server","Embedded"],
        :vendor => "CodeIgniter",
        :product => "CodeIgniter",
        :version => nil,
        :match_type => :content_title,
        :match_content =>  /Welcome to CodeIgniter/,
        :match_details =>"page title",
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
