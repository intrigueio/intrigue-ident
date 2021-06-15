module Intrigue
  module Ident
    module Check
      class Jenkins < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            { # might need to be its own, but haven't seen it yet outside jenkins
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Jenkins',
              product: 'Hudson',
              website: 'https://projects.eclipse.org/projects/technology.hudson',
              description: 'Hudson',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-hudson/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^x-hudson:(.*)$/)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Jenkins',
              product: 'Jenkins',
              website: 'https://www.jenkins.io/',
              description: 'Jenkins',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /X-Jenkins-Session/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Jenkins',
              product: 'Jenkins',
              website: 'https://www.jenkins.io/',
              description: 'Jenkins',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-jenkins/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^x-jenkins:(.*)$/)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
