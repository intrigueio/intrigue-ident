module Intrigue
  module Ident
    module Check
      class Facebook < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Marketing JavaScript],
              vendor: 'Facebook',
              product: 'JS SDK',
              website: 'https://developers.facebook.com/docs/javascript/',
              version: nil,
              description: 'Facebook JS SDK - Load String',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /(document, 'script', 'facebook-jssdk')/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              vendor: 'Facebook',
              product: 'React',
              website: 'https://reactjs.org/',
              description: 'Facebook React - Version in JS File',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{^/\*\* @license React v\d+\.\d+.\d+}i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, %r{^/\*\* @license React v(\d+\.\d+.\d+)}i)
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
