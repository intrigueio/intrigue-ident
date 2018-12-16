module Intrigue
module Ident
module Check
    class Rollbar < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Javascript"],
            :vendor => "Rollbar",
            :product => "Rollbarjs",
            :match_details => "unique javascript string ",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /_rollbarConfig/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
