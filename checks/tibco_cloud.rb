module Intrigue
module Ident
module Check
    class Tibco < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["API"],
            :vendor =>"TIBCO",
            :product =>"Mashery",
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: Mashery Proxy/i,
            :paths => ["#{url}"],
            :inference => false
          }, 
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["API"],
            :vendor =>"TIBCO",
            :product =>"Mashery",
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^x-mashery-error-code:/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end



