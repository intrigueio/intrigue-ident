module Intrigue
module Ident
module Check
    class Github < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS", "Development"],
            :vendor => "Github",
            :product => "Github",
            :match_details => "github specific header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-github-request-id:.*$/i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS", "Development"],
            :vendor => "Github",
            :product => "Github",
            :match_details => "github server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: GitHub.com$/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
