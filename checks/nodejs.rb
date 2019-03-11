module Intrigue
module Ident
module Check
    class Nodejs < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor =>"Node.js",
            :product =>"Node.js",
            :match_details =>"unique error page",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /^<pre>Cannot GET \/doesntexist-123<\/pre>$/i,
            :paths => ["#{url}/doesntexist-123"],
            :inference => true
          }
        ]
      end

    end
  end
  end
  end
