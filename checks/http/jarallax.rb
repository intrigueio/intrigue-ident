module Intrigue
  module Ident
    module Check
      class Jarallax < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              vendor: 'Jarallax',
              product: 'Jarallax',
              website: 'https://github.com/nk-o/jarallax',
              match_type: :content_body,
              match_content: /data-jarallax-video'/i,
              description: 'javascript class load',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
