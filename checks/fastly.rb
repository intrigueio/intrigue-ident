module Intrigue
module Ident
module Check
    class Fastly < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "service",
            :vendor =>"Fastly",
            :product =>"Fastly",
            :match_details =>"header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-fastly-backend-reqs/i,
            :paths => ["#{url}"]
          },
          {
            :type => "service",
            :vendor =>"Fastly",
            :product =>"Fastly",
            :match_details =>"error content in page",
            :version => nil,
            :hide => true,
            :match_type => :content_body,
            :match_content =>  /<title>Fastly error: unknown domain/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
