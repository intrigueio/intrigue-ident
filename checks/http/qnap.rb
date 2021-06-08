module Intrigue
  module Ident
    module Check
      class Qnap < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: %w[Embedded IoT Appliance NAS],
              vendor: 'QNAP',
              product: 'QTS',
              website: 'https://www.qnap.com/qts/',
              description: 'unique string',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Shone added for detecting default system language when no cookie has been set/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: %w[Embedded IoT Appliance NAS],
              vendor: 'QNAP',
              product: 'QTS',
              website: 'https://www.qnap.com/qts/',
              description: 'firmware version on handy cgi page',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /QDocRoot/,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, %r{<version><!\[CDATA\[([\d.]*)\]\]></version>})
              },
              paths: [{ path: "#{url}/cgi-bin/authLogin.cgi", follow_redirects: true }],
              require_product: 'QTS',
              inference: true
            }
          ]
        end
      end
    end
  end
end
