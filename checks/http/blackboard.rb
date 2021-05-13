module Intrigue
  module Ident
    module Check
      class Blackboard < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[COTS CMS],
              vendor: 'Blackboard',
              product: 'Blackboard',
              website: 'https://www.blackboard.com/teaching-learning/learning-management',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^x-blackboard-product: Blackboard Learn &#8482;.*$/,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x,
                                                       /^x-blackboard-product: Blackboard Learn &#8482; ([\w\d.\-+]*)$/i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS CMS],
              vendor: 'Blackboard',
              product: 'Blackboard',
              website: 'https://www.blackboard.com/teaching-learning/learning-management',
              description: 'x-blackboard-appserver header (hosted)',
              match_type: :content_headers,
              match_content: /^X-Blackboard-appserver:.*$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
            # Currently match_content too loose
            # {
            #  type: "fingerprint",
            #  category: "application",
            #  tags: ["COTS", "CMS"],
            #  vendor: "Blackboard",
            #  product: "Blackboard",
            #  description:"server header",
            #  version: nil,
            #  match_type: :content_body,
            #  match_content:  /Blackboard CMS/i,
            #  dynamic_version: nil ,
            #  paths: [ { path: "#{url}", follow_redirects: true } ],
            #  inference: true
            # }
          ]
        end
      end
    end
  end
end
