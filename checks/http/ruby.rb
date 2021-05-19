module Intrigue
  module Ident
    module Check
      class Ruby < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development'],
              vendor: 'Ruby-Lang',
              product: 'Ruby',
              website: 'https://www.ruby-lang.org/',
              description: 'Ruby - x-rack-cache Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-rack-cache:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development'],
              vendor: 'Ruby-Lang',
              product: 'Ruby',
              website: 'https://www.ruby-lang.org/',
              description: 'Ruby - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{server:.*\(Ruby/[\d.]+/[\d\-]+\)}i,
                }
              ],
              dynamic_version: ->(d) { _first_header_capture(d, %r{\(Ruby/([\d.]+)/[\d\-]+\)}) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'Proxy'],
              vendor: 'Ruby-Lang',
              product: 'Webrick',
              website: 'https://github.com/ruby/webrick',
              description: 'Ruby Webrick - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{server:.*WEBrick/[\d.]+}i,
                }
              ],
              dynamic_version: ->(d) { _first_header_capture(d, %r{WEBrick/([\d.]+)}) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
