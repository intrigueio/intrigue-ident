module Intrigue
module Ident
module Check
class Wftpserver < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS"],
        :vendor =>"Wftpserver",
        :product =>"Wing FTP Server",
        :match_details => "server header",
        :match_type => :content_headers,
        :references => [],
        :match_content => /server: Wing Ftp Server.*/i,
        :version => nil,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
