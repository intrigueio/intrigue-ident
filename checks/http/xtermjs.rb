module Intrigue
  module Ident
    module Check
      class Xtermjs < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[JavaScript Development],
              website: 'https://xtermjs.org/',
              vendor: 'Xtermjs',
              product: 'Xterm.js',
              description: 'include string',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{termjs:\ 'components/xterm\.js/xterm}i,
                }
              ],
 
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
