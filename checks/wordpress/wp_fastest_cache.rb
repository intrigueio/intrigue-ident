module Intrigue
module Ident
module Check
    class WordpressWpFastestCache < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Wordpress Plugin"],
            :vendor =>"Wordpress",
            :product =>"WP Fastest Cache",
            :references => ["https://seclists.org/fulldisclosure/2019/Mar/17"],
            :match_details =>"string in body",
            :match_type => :content_body,
            :match_content =>  /<!-- WP Fastest Cache file was created in/i,
            :version => nil,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
