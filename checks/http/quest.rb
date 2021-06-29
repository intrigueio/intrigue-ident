module Intrigue
  module Ident
    module Check
      class Quest < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Admin Panel'],
              vendor: 'Quest',
              product: 'Kace Systems Management',
              description: 'cookie',
              website: 'https://www.quest.com/kace/',
              references: [
                'https://www.securityweek.com/serious-vulnerabilities-found-kace-k1000-appliance',
                'https://www.rapid7.com/db/modules/exploit/unix/http/dell_kace_k1000_upload/'
              ],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /kboxid=/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              test_target: ["https://kace.arcosa.com/"]
            },
            # hardware cpe (inferred)
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: ['Admin Panel'],
              vendor: 'Quest',
              product: 'Kace Systems Management Appliance',
              website: 'https://www.quest.com/kace/',
              description: 'header',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-KACE-Appliance:.*$/i,
                },

              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              test_target: ["https://kace.arcosa.com/"]
            },
            # hardware cpe (inferred)
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['Admin Panel'],
              vendor: 'Quest',
              product: 'Kace Systems Management Appliance Firmware',
              website: 'https://www.quest.com/kace/',
              description: 'cookie',
              version: nil,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /kace-theme-light\.css\?build=([\d.]+)"/i)
              },
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-KACE-Appliance:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true,
              test_target: ["https://kace.arcosa.com/"]
            },
            # software cpe
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Admin Panel'],
              vendor: 'Quest',
              product: 'Kace Systems Management',
              website: 'https://www.quest.com/kace/',
              description: 'cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-KACE-Appliance:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              test_target: ["https://kace.arcosa.com/"]
            },

            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Admin Panel'],
              vendor: 'Quest',
              product: 'Kace Systems Management',
              website: 'https://www.quest.com/kace/',
              description: 'header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-KACE-Appliance:.*$/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, /kace-theme-light\.css\?build=([\d.]+)"/i)
              },
              paths: [{ path: "#{url}/userui/welcome.php", follow_redirects: true }],
              require_product: 'Kace Systems Management',
              inference: true,
              test_target: ["https://kace.arcosa.com/"]
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Admin Panel'],
              vendor: 'Quest',
              product: 'Kace Systems Management',
              website: 'https://www.quest.com/kace/',
              description: 'header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-KACE-Appliance:.*$/i,
                }
              ],
              dynamic_product: lambda { |x|
                                 "Kace Systems Management #{_first_header_capture(x, /^X-KACE-Appliance:(.*)$/i)}"
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              test_target: ["https://kace.arcosa.com/"]
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Admin Panel'],
              vendor: 'Quest',
              product: 'Kace Systems Management',
              website: 'https://www.quest.com/kace/',
              description: 'title',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^KACE Systems Management Appliance Service Center$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              test_target: ["https://kace.arcosa.com/"]
            }
          ]
        end
      end
    end
  end
end
