module Intrigue
module Ident
module SmtpCheck
class Exim < Intrigue::Ident::SmtpCheck::Base

  # 220-cp01.netmouser.com ESMTP Exim 4.92 #2 Fri, 30 Aug 2019 16:02:53 -0700 
  def generate_checks
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Mailserver"],
        :vendor => "Exim",
        :product => "Exim",
        :references => [],
        :version => nil,
        :match_type => :content_banner,
        :match_content => /ESMTP Exim/i,
        :dynamic_version => lambda { |x| _first_banner_capture(x, /ESMTP Exim ([\d\.]+)\s\#.*/i)},
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
