module Intrigue
  module Ident
    module Check
      class Akamai < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CDN'],
              vendor: 'Akamai',
              product: 'Akamai',
              website: 'https://www.akamai.com/',
              version: nil,
              match_type: :content_headers,
              match_content: /server: AkamaiGHost$/i,
              description: 'ghost server header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CDN'],
              vendor: 'Akamai',
              product: 'Akamai',
              website: 'https://www.akamai.com/',
              version: nil,
              match_type: :content_body,
              match_content: /The requested URL "&#91;no&#32;URL&#93;", is invalid.<p>/,
              description: 'Akamai Missing Uri',
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              vendor: 'Akamai',
              tags: ['CDN', 'WAF'],
              product: 'Akamai',
              website: 'https://www.akamai.com/',
              version: nil,
              match_type: :content_headers,
              match_content: /x-akamai-transformed:.*/,
              description: 'Akamai transformed header',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              vendor: 'Akamai',
              tags: ['CDN', 'WAF'],
              references: [
                'https://learn.akamai.com/en-us/webhelp/ion/web-performance-getting-started-for-http-properties/GUID-3ABC638E-14E9-4858-BD4F-BF345BC254F3.html'
              ],
              product: 'Akamai (Staging Network)',
              version: nil,
              match_type: :content_headers,
              match_content: /X-Akamai-Staging: ESSL/,
              description: 'Akamai transformed header',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              vendor: 'Akamai',
              tags: ['CDN', 'WAF'],
              references: [
                'https://learn.akamai.com/en-us/webhelp/ion/web-performance-getting-started-for-http-properties/GUID-3ABC638E-14E9-4858-BD4F-BF345BC254F3.html'
              ],
              product: 'Akamai (Staging Network)',
              version: nil,
              match_type: :content_headers,
              match_content: /X-Akamai-Staging: EdgeSuite/,
              description: 'Akamai transformed header',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
