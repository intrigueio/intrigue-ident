module Intrigue
  module Ident
    module Check
      class Atlassian < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Atlassian',
              product: 'BitBucket',
              description: 'Atlassian BitBucket',
              version: nil,
              match_type: :content_body,
              match_content: /com.atlassian.bitbucket.server/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Atlassian',
              product: 'Confluence',
              description: 'Atlassian Confluence',
              version: nil,
              match_type: :content_headers,
              match_content: /X-Confluence-Request-Time/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Atlassian',
              product: 'Crucible',
              description: 'Atlassian Crucible',
              version: nil,
              match_type: :content_body,
              match_content: /FishEye and Crucible/,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /Log in to FishEye and Crucible (.*)</)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Atlassian',
              product: 'Hipchat',
              description: 'Atlassian Hipchat',
              version: nil,
              match_type: :content_body,
              match_content: /\$\(document\).trigger\('hipchat.load'\);/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            # {
            #  type: "fingerprint",
            #  category: "application",
            #  tags: ["COTS", "Development"],
            #  vendor: "Atlassian",
            #  product:"Jira",
            #  description:"favicon",
            #  version: nil,
            #  match_type: :checksum_body_mmh3,
            #  match_content: 981867722,
            #  paths: [ { path: "#{url}/favicon.ico", follow_redirects: true } ],
            #  inference: false
            # },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Atlassian',
              product: 'Jira',
              description: 'Atlassian Jira',
              version: nil,
              match_type: :content_body,
              match_content: /jira.webresources/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Atlassian',
              product: 'Jira',
              description: 'Atlassian Jira',
              version: nil,
              match_type: :content_cookies,
              match_content: /atlassian.xsrf.token=/i,
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /<meta name="ajs-version-number" content="(.*)">/)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS Development Proxy],
              vendor: 'Atlassian',
              product: 'Proxy',
              references: ['https://community.atlassian.com/t5/Jira-questions/REST-API-not-returning-any-data-with-API-token/qaq-p/1292806'],
              description: 'proxy server header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{^server: AtlassianProxy/[\d.]+$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: AtlassianProxy/([\d.]+)$}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS Development SaaS],
              vendor: 'Atlassian',
              product: 'Statuspage',
              description: 'statuspage icon',
              version: nil,
              match_type: :content_body,
              match_content: /logos-statuspage-logo-gradient-neutral.svg/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS Development SaaS],
              vendor: 'Atlassian',
              product: 'Statuspage',
              description: 'statuspage header',
              version: nil,
              match_type: :content_headers,
              match_content: /^x-statuspage-skip-logging:.*$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS Development SaaS],
              vendor: 'Atlassian',
              product: 'Statuspage',
              description: 'statuspage header',
              version: nil,
              match_type: :content_headers,
              match_content: /^x-statuspage-version:.*$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS Development SaaS],
              vendor: 'Atlassian',
              product: 'Crowd',
              description: 'body content',
              version: nil,
              match_type: :content_body,
              match_content: /Atlassian Crowd - Login/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false, # Version:&nbsp;3.5.0
              dynamic_version: lambda { |x|
                _first_body_capture(x, /Version:&nbsp;(\d+(.\d+)?(.\d+)?)/)
              }
            }
          ]
        end
      end
    end
  end
end
