module Intrigue
  module Ident
  module SmtpCheck
  class Generic < Intrigue::Ident::SmtpCheck::Base
  
    # 220 xasdf.addfadfd.com ESMTP Sun,  4 Oct 2020 09:13:22 -0500
    def generate_checks
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["SMTPServer"],
          :vendor => "Generic",
          :product => "SMTP",
          :references => [],
          :version => nil,
          :match_type => :content_banner,
          :match_content => /ESMTP/i,
          :match_details => "ESMTP banner",
          :hide => false,
          :inference => true
        }, 
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["SMTPServer"],
          :vendor => "Generic",
          :product => "SMTP",
          :references => [],
          :version => nil,
          :match_type => :content_banner,
          :match_content => /^220.*$/i,
          :match_details => "220 banner",
          :hide => false,
          :inference => true
        }
      ]
    end
    
  end
  end
  end
  end
  