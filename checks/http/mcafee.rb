module Intrigue
  module Ident
    module Check
      class Mcafee < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Administrative COTS],
              vendor: 'McAfee',
              product: 'EPolicy Orchestrator',
              website: 'https://www.mcafee.com/enterprise/en-gb/products/epolicy-orchestrator.html',
              description: 'McAfee EPolicy Orchestrator',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /McAfee Agent Activity Log/i,
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
