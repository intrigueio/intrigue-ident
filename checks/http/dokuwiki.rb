module Intrigue
  module Ident
    module Check
      class Dokuwiki < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'Dokuwiki',
              product: 'Dokuwiki',
              website: 'https://www.dokuwiki.org/',
              version: nil,
              match_type: :content_headers,
              match_content: /DokuWiki=/,
              description: 'Dokuwiki - DokuWiki cookie',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
