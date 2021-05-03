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
              description: 'unique body string',
              version: nil,
              match_type: :content_body,
              match_content: %r{user">Logged in as: dr\.who</div>}im,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development COTS],
              vendor: 'Hadoop',
              product: 'YARN',
              website: 'https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html',
              description: 'Hadoop YARN - root.users.dr_dr_who Page Reference',
              version: nil,
              match_type: :content_body,
              match_content: /root.users.dr_dot_who/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
