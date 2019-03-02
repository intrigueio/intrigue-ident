module Intrigue
module Ident
module Check
    class Heroku < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting"],
            :vendor => "Heroku",
            :product =>"Heroku",
            :match_details =>"Heroku (hijackable?)",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /herokucdn.com\/error-pages\/no-such-app.html/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting"],
            :vendor => "Heroku",
            :product =>"Heroku",
            :match_details =>"Heroku",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^via: [\d\.]+ vegur/i,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting"],
            :vendor => "Heroku",
            :product =>"Heroku",
            :match_details =>"Heroku",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Cowboy$/i,
            :hide => false,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
