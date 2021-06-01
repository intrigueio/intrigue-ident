module Intrigue
  module Ident
    module Check
      class Kubernetes < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Cloud CI/CD Development],
              vendor: 'Kubernetes',
              product: 'Kubernetes',
              website: 'https://kubernetes.io/',
              description: 'Audit-id header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /Audit-Id: [a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89aAbB][a-f0-9]{3}-[a-f0-9]{12}/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Cloud CI/CD Development],
              vendor: 'Kubernetes',
              product: 'Kubernetes',
              website: 'https://kubernetes.io/',
              description: "Kubernetes - Body Match",
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{groupVersion":"apiregistration.k8s.io/v1beta1},
                },
                {
                  match_type: :content_body,
                  match_content: /forbidden: User \\"system:anonymous\\" cannot get path/,
                },
                {
                  match_type: :content_body,
                  match_content: /serverAddressByClientCIDRs/,
                },
                {
                  match_type: :content_body,
                  match_content: /^default backend - 404$/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
          ]
        end
      end
    end
  end
end
