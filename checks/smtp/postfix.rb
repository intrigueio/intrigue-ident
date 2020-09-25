module Intrigue
  module Ident
  module SmtpCheck
  class Postfix < Intrigue::Ident::SmtpCheck::Base
  
    # 220-cp01.netmouser.com ESMTP Exim 4.92 #2 Fri, 30 Aug 2019 16:02:53 -0700 
    def generate_checks
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["SMTPServer"],
          :vendor => "Postfix",
          :product => "Postfix",
          :references => [],
          :match_type => :content_banner,
          :match_content => /220 ESMTP Postfix/i,
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
  