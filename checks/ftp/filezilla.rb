module Intrigue
module Ident
module FtpCheck
class Filezilla < Intrigue::Ident::FtpCheck::Base

  def generate_checks
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["FTPServer"],
        :vendor => "Filezilla",
        :product => "Server",
        :references => [],
        :version => nil,
        :match_type => :content_banner,
        :match_content => /FileZilla Server/i,
        :dynamic_version => lambda { |x| _first_banner_capture(x, /FileZilla Server version ([\d\.]+)/i)},
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
