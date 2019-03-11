module Intrigue
module Ident
module Check
    class PivotalSoftware < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor =>"Pivotal Software",
            :product =>"Spring Framework",
            :match_details =>"Standard Spring MVC error page",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /\{\"timestamp\":\d.*,\"status\":999,\"error\":\"None\",\"message\":\"No message available\"\}/,
            :paths => ["#{url}/error.json"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor =>"Pivotal Software",
            :product =>"Spring Framework",
            :match_details =>"spring cache header",
            :references => ["https://github.com/atramos/springy-aws"],
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /^x-springy-cache-disabled:.*$/i,
            :paths => ["#{url}"],
            :examples => ["x-springy-cache-disabled: 0"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor =>"Pivotal Software",
            :product =>"Spring Boot",
            :match_details =>"spring cache header",
            :references => ["https://stackoverflow.com/questions/40379550/what-is-x-application-context-header"],
            :match_type => :content_headers,
            :version => nil,
            :match_content =>  /^X-Application-Context.*$/i,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Development", "Database"],
            :vendor => "Pivotal Software",
            :product => "RabbitMQ",
            :match_details =>"RabbitMQ",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /RabbitMQ Management/,
            :paths => ["#{url}"],
            :inference => false
          },
          {
           :type => "fingerprint",
           :category => "application",
           :tags => ["Development", "Database"],
           :vendor => "Pivotal Software",
           :product => "RabbitMQ",
           :match_details => "RabbitMQ API",
           :match_type => :content_body,
           :version => nil,
           :match_content =>  /RabbitMQ Management HTTP API/,
           :paths => ["#{url}/api"],
           :inference => false
         }
        ]
      end

    end
  end
  end
  end
