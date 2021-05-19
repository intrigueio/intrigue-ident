module Intrigue
  module Ident
    module Check
      class Symantec < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Security JavaScript],
              vendor: 'Symantec',
              product: 'Norton Secured Seal',
              references: ['https://www.websecurity.symantec.com/install-norton-secured-seal'],
              description: 'security seal',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{seal\.verisign\.com/getseal\?host_name=}i,
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
