module Intrigue
  module Ident
    module Check
      class Kibana < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ["Development", "Database", "Login Panel"],
              vendor: 'Elasticsearch',
              product: 'Kibana',
              website: 'https://www.elastic.co/kibana',
              description: 'Elasticsearch Kibana - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^kbn-name:.*$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^kbn-xpack-sig:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ["Development", "Database", "Admin Panel"],
              vendor: 'Elasticsearch',
              product: 'Kibana',
              website: 'https://www.elastic.co/kibana',
              description: 'kbn-* header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^kbn-version:(.*)$/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^^kbn-version:(.*)$/i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
