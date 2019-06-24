module Intrigue
module Ident
module Check
    class Debian < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["OS"],
            :vendor =>"Debian",
            :product =>"Linux",
            :match_details =>"nginx test page",
            :version => nil,
            :match_type => :content_title,
            :match_content =>  /^Welcome to nginx on Debian\!$/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
