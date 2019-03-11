module Intrigue
module Ident
module Check
    class Zeit < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework", "Javascript"],
            :vendor =>"Zeit",
            :product =>"Next.js",
            :match_details =>"x-powered-by header",
            :references => ["https://zeit.co/blog/next"],
            :match_type => :content_headers,
            :match_content =>  /x-powered-by: Next.js/i,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/x-powered-by: Next.js\ (.*)/i)
            },
            :paths => ["#{url}"],
            :inference => true 
          }
        ]
      end

    end
  end
  end
  end
