module Intrigue
module Ident
module Check
class Springfox < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["API"],
        vendor:"Springfox",
        product:"Swagger UI",
        references: ["https://reflectoring.io/documenting-spring-data-rest-api-with-springfox/"],
        description:"content",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /src=\'webjars\/springfox-swagger-ui\/springfox.js\'/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }, 
      {
        type: "fingerprint",
        category: "service",
        tags: ["API"],
        vendor:"Springfox",
        product:"Swagger UI",
        references: ["https://reflectoring.io/documenting-spring-data-rest-api-with-springfox/"],
        description:"title",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_title,
            match_content:  /Swagger UI/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }

    ]
  end

end
end
end
end
