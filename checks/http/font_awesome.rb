module Intrigue
  module Ident
    module Check
      class FontAwesome < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development'],
              vendor: 'FontAwesome',
              product: 'FontAwesome',
              website: 'https://fontawesome.com/',
              description: 'fontawesome css load',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{href="https://use.fontawesome.com/releases/v([\d.]+)/css/all\.css"}i,
                }
              ],
              dynamic_version: lambda { |d|
                                 _first_body_capture(d, %r{href="https://use.fontawesome.com/releases/v([\d.]+)/css/all\.css"}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
