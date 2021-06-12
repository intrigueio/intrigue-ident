module Intrigue
  module Ident
    module Check
      class Wildfly < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Wildfly',
              product: 'Wildfly',
              references: ['https://wildfly.org/about/'],
              description: 'Wildfly - Server Header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server:\ WildFly/(\d{1,2})$}i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server:\ WildFly/(\d{1,2})$}i)
                               },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
