module Intrigue
  module Ident
    module Check
      class Pjax < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              vendor: 'pjax',
              product: 'pjax',
              website: 'https://github.com/MoOx/pjax',
              description: 'pjax - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-pjax:.*/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^vary:.*x-pjax.*/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
          ]
        end
      end
    end
  end
end
