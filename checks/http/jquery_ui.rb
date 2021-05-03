module Intrigue
  module Ident
    module Check
      class JqueryUi < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Javascript'],
              vendor: 'JQuery',
              product: 'JQuery UI',
              website: 'https://jqueryui.com/',
              description: 'unique sting',
              match_type: :content_body,
              match_content: /,this\._getPanelForTab\(this\.active\)\.show\(\)\.attr\(\{"aria-hid/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Javascript'],
              vendor: 'JQuery',
              product: 'JQuery UI',
              website: 'https://jqueryui.com/',
              description: 'version in js file',
              match_type: :content_body,
              match_content: /jQuery UI - v/i,
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /\*! jQuery UI - v([\d.]+)/i)
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
