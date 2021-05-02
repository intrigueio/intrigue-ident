module Intrigue
  module Ident
    module Check
      class Lithium < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[SaaS CMS],
              vendor: 'Lithium',
              product: 'Lithium',
              references: [
                'https://community.khoros.com/t5/Khoros-Community-Discussions/On-Premise-Hosting/td-p/213256'
              ],
              description: 'Lithium Community Management',
              match_type: :content_cookies,
              version: nil,
              match_content: /LithiumVisitor/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[SaaS CMS],
              vendor: 'Lithium',
              product: 'Lithium',
              website: 'https://khoros.com/',
              description: 'Lithium Community Management',
              match_type: :content_cookies,
              version: nil,
              match_content: /LiSESSIONID/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
