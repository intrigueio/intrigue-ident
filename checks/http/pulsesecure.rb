module Intrigue
  module Ident
    module Check
      class PulseSecure < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking VPN],
              vendor: 'PulseSecure',
              product: 'Pulse Connect Secure',
              description: 'PulseSecure Pulse Connect Secure - Title Match',
              references: [],
              match_logic: :any,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Junos Pulse Secure Access Service$/,
                },
                {
                  match_type: :content_title,
                  match_content: /^Pulse&#32;Connect&#32;Secure$/,
                }
              ],
              version: nil,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking VPN],
              vendor: 'PulseSecure',
              product: 'Pulse Connect Secure',
              description: 'PulseSecure Pulse Connect Secure - Body Match',
              references: [
                'https://kb.pulsesecure.net/articles/Pulse_Secure_Article/KB40250',
                'https://github.com/carnal0wnage/Metasploit-Code/blob/master/modules/auxiliary/scanner/juniper_scan.rb',
                'http://carnal0wnage.attackresearch.com/2013/05/funky-juniper-urls.html' # <^ TODO ... task?
              ],
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<td background="/dana-na/imgs/footerbg.gif">},
                },
                {
                  match_type: :content_body,
                  match_content: %r{src="/dana-na/css/ds.js">},
                },
                {
                  match_type: :content_body,
                  match_content: /DSSETUP_BUILD_VERSION/,
                },
                {
                  match_type: :content_body,
                  match_content: %r{<img border="0" src="/dana-na/auth/welcome\.cgi\?},
                }
              ],
              version: nil,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
          ]
        end
      end
    end
  end
end
