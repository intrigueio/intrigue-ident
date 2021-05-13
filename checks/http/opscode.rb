module Intrigue
  module Ident
    module Check
      class Opscode < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Opscode',
              product: 'Chef',
              website: 'https://www.chef.io/',
              description: 'Opscode Chef - Chef Server Title Page Reference',
              version: nil,
              match_type: :content_body,
              match_content: %r{<title>Chef Server</title>},
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /Version\ (.*)\ &mdash;/)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['COTS', 'Development'],
              vendor: 'Opscode',
              product: 'Chef',
              website: 'https://www.chef.io/',
              description: 'Opscode Chef - chef-manage Cookie Match',
              version: nil,
              match_type: :content_cookies,
              match_content: /chef-manage/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
