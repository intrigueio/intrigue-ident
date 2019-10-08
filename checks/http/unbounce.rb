module Intrigue
module Ident
module Check
    class Unbounce < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosted","SaaS"],
            :vendor =>"Unbounce",
            :product =>"Unbounce",
            :match_details =>"missing account string",
            :references => [],
            :match_type => :content_body,
            :match_content =>  /The requested URL was not found on this server./i,
            :paths => ["#{url}"],
            :inference => false,
            :hide => true
          }
        ]
      end

    end
  end
  end
  end
