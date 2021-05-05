module Intrigue
  module Ident
    module Check
      class VueJs < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Javascript'],
              vendor: 'Vue.js',
              product: 'Vue.js',
              website: 'https://vuejs.org/',
              description: 'Vue.js - vue.min.js Script Page Reference',
              version: nil,
              match_type: :content_body,
              match_content: /vue\.min\.js["|']>/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
