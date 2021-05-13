module Intrigue
  module Ident
    module Check
      class Cpanel < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[COTS Hosting Administrative],
              vendor: 'cPanel',
              product: 'cPanel',
              website: 'https://cpanel.net/',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /server: cPanel/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[COTS Hosting Administrative],
              vendor: 'cPanel',
              product: 'cPanel Hosted - Missing Page',
              website: 'https://cpanel.net/',
              description: 'cPanel Hosted, but either misconfigured, or accessed via ip vs hostname?',
              version: nil,
              match_type: :content_body,
              match_content: %r{URL=/cgi-sys/defaultwebpage.cgi},
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[COTS Administrative],
              vendor: 'cPanel',
              product: 'cPanel - Not configured',
              website: 'https://cpanel.net/',
              description: 'cPanel - not yet configured',
              version: nil,
              match_type: :content_body,
              match_content: %r{href="/cpanel">log in</a> to launch this site},
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              examples: ['href="/cpanel">log in</a> to launch this site'],
              inference: false
            }
          ]
        end
      end
    end
  end
end
