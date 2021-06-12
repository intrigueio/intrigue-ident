module Intrigue
  module Ident
    module Check
      class Sitecore < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CMS'],
              vendor: 'Sitecore',
              product: 'CMS',
              website: 'https://www.sitecore.com/',
              description: 'Sitecore Analytics Cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /SC_ANALYTICS_GLOBAL_COOKIE=/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Sitecore',
              product: 'CMS',
              website: 'https://www.sitecore.com/',
              description: 'powered by header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-powered-by:.*Sitecore CMS/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Sitecore',
              product: 'CMS',
              website: 'https://www.sitecore.com/',
              description: 'powered by header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<major>/,
                }
              ],
              paths: [{ path: "#{url}/sitecore/shell/sitecore.version.xml", follow_redirects: true }],
              dynamic_version: lambda { |x|
                majorx = _body(x).scan(%r{<major>(\d+)</major>}).first
                major = majorx[0] if majorx

                minorx = _body(x).scan(%r{<minor>(\d+)</minor>}).first
                minor = minorx[0] if minorx

                revisionx = _body(x).scan(%r{<revision>(\d+)</revision>}).first
                revision = revisionx[0] if revisionx

                buildx = _body(x).scan(%r{<build>(\d+)</build>}).first
                build = buildx[0] if buildx

                out = "#{major}.#{minor}.#{revision}"
                out << ".#{build}" if build

                out
              },
              require_vendor_product: 'sitecore_cms',
              inference: true
            }
          ]
        end
      end
    end
  end
end
