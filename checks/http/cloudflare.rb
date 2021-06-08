module Intrigue
  module Ident
    module Check
      class Cloudflare < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /1.1.1.1 â\u0080\u0094 The free app that makes your Internet faster./i,
                }
              ],
              description: 'cloudflare known error',
              dynamic_hide: lambda { |x|
                return true if _uri_match(x, /1\.1\.1\.1:/) || _uri_match(x, /1\.0\.0\.1:/)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /cf_ob_info=/i,
                },
                {
                  match_type: :content_cookies,
                  match_content: /__cfduid/i,
                }
              ],
              description: 'Cloudflare - Cookies Match',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              description: 'Cloudflare - Error Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /cferror_details/,
                },
                {
                  match_type: :content_body,
                  match_content: %r{403\ Forbidden</h1></center>\n<hr><center>cloudflare</center>}im,
                },
                {
                  match_type: :content_body,
                  match_content: /^error code: 1003$/im,
                },
                {
                  match_type: :content_title,
                  match_content: /DNS resolution error \| [\d\w.]+ \| Cloudflare/i,
                },
                {
                  match_type: :content_title,
                  match_content: /\| 525: SSL handshake failed/mi,
                },
                {
                  match_type: :content_body,
                  match_content: / network. A valid Host header must be supplied to reach the desired website./mi,
                },
                {
                  match_type: :content_body,
                  match_content: %r{<title>403 Forbidden</title>.*<center>cloudflare</center>}mi,
                },
                {
                  match_type: :content_title,
                  match_content: /Direct IP access not allowed \| Cloudflare/,
                }
              ],
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF PaaS],
              vendor: 'Cloudflare',
              product: 'Cloudflare',
              website: 'https://www.cloudflare.com/',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^cf(-)?ray:/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^cf-ray:/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /cloudflare-nginx/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^server: cloudflare$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^expect-ct:.*cloudflare.com.*$/i,
                }
              ],
              description: 'Cloudflare - Headers Match',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
          ]
        end
      end
    end
  end
end
