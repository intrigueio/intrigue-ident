module Intrigue
  module Ident
    module Check
      class Openbsd < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'OpenBSD',
              product: 'LibreSSL',
              website: 'https://www.libressl.org/',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^.*LibreSSL/.*$}i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*LibreSSL/([\w\d.\-]*)\s.*$}i)
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
