module Intrigue
module Ident
module Check
    class Synacor < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Productivity","COTS"],
            :vendor =>"Synacor",
            :product =>"Zimbra Collaboration Suite",
            :match_details =>"login page for zimbra",
            :match_type => :content_body,
            :match_content =>  /<title>Zimbra Web Client Sign In/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
