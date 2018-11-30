module Intrigue
module Ident
module Check
    class PingIdentiy < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["IAM"],
            :vendor => "PingIdentity",
            :product =>"PingFederate",
            :references => ["https://ping.force.com/Support/PingFederate/Administration/Single-sign-on-no-target796070NEW"],
            :match_details =>"redirect (may be interesting)",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^location:.*startSSO.ping/,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
