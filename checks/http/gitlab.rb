module Intrigue
  module Ident
    module Check
      class Gitlab < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Gitlab',
              product: 'Gitlab',
              website: 'https://about.gitlab.com/',
              description: 'Gitlab',
              version: nil,
              match_type: :content_cookies,
              match_content: /_gitlab_session/i,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /window.gon={};gon.api_version="v([0-9.])"/i)
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
