module Intrigue
  module Ident
    module Check
      class Axios < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              vendor: 'Axios',
              product: 'Axios',
              website: 'https://github.com/axios/axios',
              version: nil,
              match_type: :content_body,
              match_content: /axios\.min\.js["|']>/i,
              description: 'filename',
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
