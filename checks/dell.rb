module Intrigue
module Ident
module Check
    class Dell < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["OS"],
            :vendor =>"Dell",
            :product =>"KACE K1000 Systems Management Appliance",
            :match_details =>"cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /kboxid=/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
