module Intrigue
module Ident
module SmtpCheck
class Emailtopia < Intrigue::Ident::SmtpCheck::Base

  # 220-cp01.netmouser.com ESMTP Exim 4.92 #2 Fri, 30 Aug 2019 16:02:53 -0700 
  def generate_checks
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["SMTPServer"],
        :vendor => "Emailtopia",
        :product => "Response Manager",
        :references => [],
        :version => nil,
        :match_type => :content_banner,
        :match_content => /emailtopia Response Manager [\d\.]+ SMTP service ready/i,
        :dynamic_version => lambda { |x| _first_banner_capture(x, /emailtopia Response Manager ([\d\.]+) SMTP service ready/i)},
        :match_details => "banner",
        :inference => true
      }
    ]
  end
  
end
end
end
end
