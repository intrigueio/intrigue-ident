module Intrigue
  module Ident
    module Check
      class Docker < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Virtualization'],
              vendor: 'Docker',
              product: 'Docker',
              website: 'https://www.docker.com/',
              match_details: 'body content',
              match_type: :content_body,
              version: nil,
              match_content: /"ApiVersion".*"KernelVersion"/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /"Version": ?"(\d+\.\d+\.[a-zA-z0-9\-]{2,})"/)
                               }
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Virtualization'],
              vendor: 'Docker',
              product: 'Docker',
              website: 'https://www.docker.com/',
              match_details: 'header match',
              match_type: :content_headers,
              version: nil,
              match_content: %r{Server: Docker/.*},
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{Docker/(\d+\.\d+\.[a-zA-z0-9\-]{2,})})
                               }
            }
          ]
        end
      end
    end
  end
end
