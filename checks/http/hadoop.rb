module Intrigue
  module Ident
    module Check
      class Hadoop < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development COTS],
              vendor: 'Hadoop',
              product: 'YARN',
              website: 'https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html',
              description: 'Hadoop YARN - Body Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{user">Logged in as: dr\.who</div>}im,
                },
                {
                  match_type: :content_body,
                  match_content: /root.users.dr_dot_who/i,
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
