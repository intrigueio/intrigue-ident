module Intrigue
module Ident
module Check
    class Xerox < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["IoT","Printer"],
            :vendor => "Xerox",
            :product => "WorkCentre Printer",
            :references => [],
            :match_details =>"title",
            :match_type => :content_title,
            :match_content => /CentreWare Internet Services/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
