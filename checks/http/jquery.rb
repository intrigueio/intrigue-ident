module Intrigue
  module Ident
    module Check
      class Jquery < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              website: 'https://jquery.com/',
              vendor: 'JQuery',
              product: 'JQuery',
              description: 'version in js file',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /jQuery v(\d+(\.\d+)*) \| \(c\) JS Foundation and other contributors/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, /jQuery v(\d+(\.\d+)*) \| \(c\) JS Foundation and other contributors/i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              website: 'https://jquery.com/',
              vendor: 'JQuery',
              product: 'JQuery',
              description: 'script page referece',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{script\ src=["|']https://code\.jquery\.com/jquery-}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              website: 'https://jquery.com/',
              vendor: 'JQuery',
              product: 'Datatables',
              description: 'script page referece',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /jquery\.dataTables\.min\.js["|']>/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              website: 'https://jquery.com/',
              vendor: 'JQuery',
              product: 'JQuery',
              description: 'script page referece',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{src=.*?/jquery-(\d+(\.\d+)*)(?:\.min)?.js}i,
                }
              ],
              dynamic_version: ->(x) { _first_body_capture(x, %r{src=.*?/jquery-(\d+(\.\d+)*)(?:\.min)?.js}i) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
