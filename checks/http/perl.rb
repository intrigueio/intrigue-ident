module Intrigue
  module Ident
    module Check
      class Perl < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Perl',
              product: 'Perl',
              website: 'https://www.perl.org/',
              description: 'Perl - Server Header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^.*Perl/.*$}i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*Perl/v([\d.]*)\s.*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Perl',
              product: 'Dancer2',
              references: ['https://metacpan.org/pod/Dancer2'],
              version: nil,
              description: 'Perl Dancer 2 - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: Perl Dancer2/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /server:.*Perl Dancer2.*([\d.]*).*/i)
                               },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Perl',
              product: 'HTTP::Server::PSGI',
              references: ['https://metacpan.org/pod/HTTP::Server::PSGI'],
              version: nil,
              description: 'Perl HTTP::Server::PSGI - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: HTTP::Server::PSGI/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /server:.*HTTP::Server::PSGI/i)
                               },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
