module Intrigue
module Ident
module Check
  class Springfox < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["API"],
          :vendor =>"Springfox",
          :product =>"Swagger UI",
          :references => ["https://reflectoring.io/documenting-spring-data-rest-api-with-springfox/"],
          :match_details =>"content",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /src=\'webjars\/springfox-swagger-ui\/springfox.js\'/i,
          :paths => ["#{url}"],
          :inference => false
        }, 
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["API"],
          :vendor =>"Springfox",
          :product =>"Swagger UI",
          :references => ["https://reflectoring.io/documenting-spring-data-rest-api-with-springfox/"],
          :match_details =>"title",
          :version => nil,
          :match_type => :content_title,
          :match_content =>  /Swagger UI/i,
          :paths => ["#{url}"],
          :inference => false
        }

      ]
    end

  end
end
end
end
