module Intrigue
  module Ident
    module Check
      class PhpMyAdmin < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Administrative', 'COTS'],
              vendor: 'PhpMyAdmin',
              product: 'PhpMyAdmin',
              website: 'https://www.phpmyadmin.net/',
              description: 'PhpMyAdmin',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /phpMyAdmin=/i
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development', 'COTS', 'Login Panel'],
              vendor: 'PhpMyAdmin',
              product: 'PhpMyAdmin',
              website: 'https://www.phpmyadmin.net/',
              description: 'PhpMyAdmin',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /PhpMyAdmin/i
                }
              ],
              dynamic_version: lambda { |x|
                _first_title_capture(x,
                                    /PhpMyAdmin (\d+(\.\d+)*)/i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              test_target: ["http://178.18.253.86:8020/"],
            }
          ]
        end
      end
    end
  end
end
