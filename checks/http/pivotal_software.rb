module Intrigue
  module Ident
    module Check
      class PivotalSoftware < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Pivotal Software',
              product: 'Spring Framework',
              website: 'https://spring.io/',
              description: 'Standard Spring MVC error page',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /\{"timestamp":.*,"status":.*,"error":".*","message":".*"\}/
                },
                {
                  match_type: :content_body,
                  match_content: %r{This application has no explicit mapping for /error, so you are seeing this as a fallback}i
                }
              ],
              paths: [{ path: "#{url}/error.json", follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Pivotal Software',
              product: 'Spring Framework',
              website: 'https://spring.io/',
              description: 'spring cache header',
              references: ['https://github.com/atramos/springy-aws'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /^x-springy-cache-disabled:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              examples: ['x-springy-cache-disabled: 0'],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Pivotal Software',
              product: 'Spring Boot',
              website: 'https://spring.io/',
              description: 'spring cache header',
              references: ['https://stackoverflow.com/questions/40379550/what-is-x-application-context-header'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-Application-Context.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development Database],
              vendor: 'Pivotal Software',
              product: 'RabbitMQ',
              description: 'RabbitMQ',
              website: 'https://www.rabbitmq.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /RabbitMQ Management/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development Database],
              vendor: 'Pivotal Software',
              product: 'RabbitMQ',
              website: 'https://www.rabbitmq.com/',
              description: 'RabbitMQ API',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /RabbitMQ Management HTTP API/,
                }
              ],
              paths: [{ path: "#{url}/api", follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Pivotal Software',
              product: 'tc server',
              description: 'body version string',
              references: ['https://www.vmware.com/products/pivotal-tcserver.html'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Pivotal tc Server Standard Edition [\d.]+\.RELEASE/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /Pivotal tc Server Standard Edition\ ([\d.]+)\.RELEASE/i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
