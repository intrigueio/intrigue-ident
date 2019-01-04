module Intrigue
module Ident
module Check
    class Webflow < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework", "Javascript"],
            :vendor =>"Webflow",
            :product =>"Webflow",
            :match_details =>"body string",
            :references => ["https://webflow.com"],
            :match_type => :content_body,
            :match_content =>  /data-wf-page=\"/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
