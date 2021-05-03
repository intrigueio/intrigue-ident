module Intrigue
  module Ident
    module Check
      class Zoho < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Support'],
              vendor: 'Zoho',
              product: 'ManageEngine Desktop',
              website: 'https://www.manageengine.com/',
              description: 'title',
              references: [],
              match_type: :content_title,
              match_content: /ManageEngine Desktop Central/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Support'],
              vendor: 'Zoho',
              product: 'ManageEngine ServiceDesk',
              website: 'https://www.manageengine.com/products/service-desk/',
              description: 'title',
              references: [],
              match_type: :content_title,
              match_content: /ManageEngine ServiceDesk/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Support'],
              vendor: 'Zoho',
              product: 'ManageEngine AssetExplorer',
              website: 'https://www.manageengine.com/products/asset-explorer/',
              description: 'title',
              references: [],
              match_type: :content_title,
              match_content: /ManageEngine AssetExplorer/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Support'],
              vendor: 'Zoho',
              product: 'Zoho',
              description: 'Zoho',
              website: 'https://www.zoho.com/',
              version: nil,
              match_type: :content_headers,
              match_content: /^server:\ ZGS$/i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /^server:\ ZGS$/i)
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
