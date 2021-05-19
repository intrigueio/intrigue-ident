module Intrigue
  module Ident
    module Check
      class Php < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework', 'Language'],
              vendor: 'PHP',
              product: 'PHP',
              website: 'https://www.php.net/',
              description: 'x-powered-by header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-powered-by: PHP/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{x-powered-by: PHP/(.*)}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework', 'Language'],
              vendor: 'PHP',
              product: 'PHP',
              website: 'https://www.php.net/',
              description: 'apache server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server:.*PHP/[\d.]+.*}i,
                }
              ],
              dynamic_version: lambda { |x|
                # check for backported OS type
                backported = false
                backported = true if _first_header_match(x, /^server:.*\(CentOS\).*$/)
                backported = true if _first_header_match(x, /^server:.*\(Red Hat\).*$/)
                backported = true if _first_header_match(x, /^server:.*\(Red Hat Enterprise Linux\).*$/)

                # grab the version
                version = _first_header_capture(x, %r{^server:.*PHP/([\d.]+).*}i)

                # return a version string that indicates we can't do inference
                return "#{version} (Backported)" if backported

                # otherwise just return the version
                version
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework', 'Language'],
              vendor: 'PHP',
              product: 'PHP',
              website: 'https://www.php.net/',
              description: 'PHPSESSID cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /PHPSESSID=.*/i,
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
