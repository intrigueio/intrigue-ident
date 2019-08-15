module Intrigue
module Ident
module FtpCheck
class ProFtp < Intrigue::Ident::FtpCheck::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["FTP Server"],
        :vendor => "ProFTP",
        :product => "ProFTPd",
        :references => [],
        :version => nil,
        :match_type => :content_banner,
        :match_content => /ProFTPD ([\d\w\.]+) Server/i,
        :dynamic_version => lambda { |x| _first_banner_capture(x, /ProFTPD ([\d\w\.]+) Server/i)},
        :match_details => "banner",
        :hide => false,
        :inference => true
      }
    ]
  end
end
end
end
end
