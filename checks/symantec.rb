module Intrigue
module Ident
module Check
    class Symantec < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "service",
            :vendor =>"Symantec",
            :product =>"Norton Secured Seal",
            :references => ["https://www.websecurity.symantec.com/install-norton-secured-seal"],
            :match_details =>"security seal",
            :match_type => :content_body,
            :match_content => /seal\.verisign\.com\/getseal\?host_name=/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
