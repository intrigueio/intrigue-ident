module Intrigue
  module Ident
    module Check
      class Jupyter < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Jupyter',
              product: 'Notebook',
              website: 'https://jupyter.org/',
              description: 'matched jupyterhub header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-jupyterhub-version:/i,
                }
              ],
              dynamic_version: ->(x) { _first_header_capture(x, /^x-jupyterhub-version: (.*)$/) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Jupyter',
              product: 'Notebook',
              website: 'https://jupyter.org/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /data-notebook-path:/i,
                }
              ],
              description: 'unique body string: data-notebook-path',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Jupyter',
              product: 'Notebook',
              website: 'https://jupyter.org/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Home Page - Select or create a notebook/i,
                }
              ],
              description: 'unique title',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }

          ]
        end
      end
    end
  end
end
