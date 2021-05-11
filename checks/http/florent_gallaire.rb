module Intrigue
  module Ident
    module Check
      class FlorentGallaire < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WSGI'],
              vendor: 'Florent Gallaire',
              product: 'WSGIsserver',
              website: 'https://pypi.org/project/WSGIserver/',
              version: nil,
              match_type: :content_headers,
              match_content: /Server: WSGIServer.*/i,
              dynamic_version: ->(x) { _first_header_capture(x, %r{Server: WSGIServer/([\d.]+)}i) },
              description: 'server header',
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
