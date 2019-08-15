module Intrigue
module Ident
module Check
    class Fastly < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting", "CDN", "WAF"],
            :vendor =>"Fastly",
            :product =>"Fastly",
            :match_details =>"header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-fastly-backend-reqs:/i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting", "CDN", "WAF"],
            :vendor =>"Fastly",
            :product =>"Fastly",
            :match_details =>"header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-fastly-service:/i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting", "CDN", "WAF"],
            :vendor =>"Fastly",
            :product =>"Fastly",
            :match_details =>"error content in page",
            :version => nil,
            :hide => true,
            :match_type => :content_title,
            :match_content =>  /Fastly error: unknown domain/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
