module Intrigue
  module Ident
    module Check
      class Phusion < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Phusion',
              product: 'Passenger',
              website: 'https://www.phusionpassenger.com/',
              description: 'Phusion Passenger - X-Powered-By Header',
              version: nil,
              match_type: :content_headers,
              match_content: /^x-powered-by: Phusion Passenger.*$/,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /x-powered-by: Phusion Passenger (.*)/i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Phusion',
              product: 'Passenger',
              website: 'https://www.phusionpassenger.com/',
              description: 'Phusion Passenger - Server Header (w/o underscore)',
              version: nil,
              match_type: :content_headers,
              match_content: /^server:.*Phusion Passenger.*$/,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /^server:.*Phusion Passenger\ ([\d.]*).*/i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Phusion',
              product: 'Passenger',
              website: 'https://www.phusionpassenger.com/',
              description: 'Phusion Passenger - Server Header (w underscore)',
              version: nil,
              match_type: :content_headers,
              match_content: /^server:.*Phusion_Passenger.*$/,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server:.*Phusion_Passenger/([\w\d.\-]*)\s.*$}i)
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
