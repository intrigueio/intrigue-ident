module Intrigue
  module Ident
    module Check
      class PhpWind < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'Phpwind',
              product: 'Phpwind',
              references: ['https://www.phpwind.net/'],
              version: nil,
              description: 'Phpwind - generator metadata page reference',
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<meta name="generator" content="phpwind/i
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /<meta name="generator" content="phpwind v?(\d+(\.\d+)*)/i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'Phpwind',
              product: 'Phpwind',
              references: ['https://www.phpwind.net/'],
              version: nil,
              description: 'Phpwind - powered by page reference',
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{(Powered|Code) by\s*\n*<a href="http://www\.phpwind\.net/"}i
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
