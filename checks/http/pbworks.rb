module Intrigue
  module Ident
    module Check
      class Pbworks < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['SaaS'],
              vendor: 'PbWorks',
              product: 'PbWorks',
              website: 'https://www.pbworks.com/',
              description: 'unique link',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{pbworks.com/shared/statics}i,
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
