module Intrigue
module Ident
module Check
    class Globalscape < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS"],
            :vendor => "Globalscape",
            :product => "Secure FTP Server",
            :match_details => "lost password link",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /\/EFTClient\/Account\/LostPassword.htm/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
