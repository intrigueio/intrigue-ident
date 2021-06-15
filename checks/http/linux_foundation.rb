module Intrigue
  module Ident
    module Check
      class LinuxFoundation < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development'],
              vendor: 'LinuxFoundation',
              product: 'Argo Continuous Delivery',
              references: [
                'https://argoproj.github.io/argo-cd/',
                'https://www.soluble.ai/blog/argo-cves-2020'
              ],
              match_logic: :any,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Argo CD$/i,
                }
              ],
              description: 'page title',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
