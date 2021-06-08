module Intrigue
  module Ident
    module Check
      class AspNetForum < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'JitBit',
              product: 'AspNetForum',
              references: ['https://www.jitbit.com/asp-net-forum/'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{AspNetForum v.(\d.*?)</}i,
                }
              ],
              dynamic_version: ->(x) { _first_body_capture(x, %r{AspNetForum v.(\d.*?)</}i) },
              description: 'header match',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
