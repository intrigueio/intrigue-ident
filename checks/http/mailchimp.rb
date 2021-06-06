module Intrigue
  module Ident
    module Check
      class Mailchimp < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing SaaS],
              vendor: 'Mailchimp',
              product: 'Mandrill',
              website: 'https://mailchimp.com/features/transactional-email/',
              description: 'login page',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Log in to Mandrill/i,
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
