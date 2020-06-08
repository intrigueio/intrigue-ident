module Intrigue
  module Ident
  module SmtpCheck
  class Mailchimp < Intrigue::Ident::SmtpCheck::Base
  
    # 220-cp01.netmouser.com ESMTP Exim 4.92 #2 Fri, 30 Aug 2019 16:02:53 -0700 
    def generate_checks
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Mailserver"],
          :vendor => "Mailchimp",
          :product => "Mandrill",
          :references => [],
          :match_type => :content_banner,
          :match_content => /220 smtp.mandrillapp.com ESMTP\r\n/i,
          :match_details => "banner",
          :hide => false,
          :inference => false
        }
      ]
    end
    
  end
  end
  end
  end
  