module Intrigue
  module Ident
    module Check
      class Cherokee < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Cherokee-Project',
              product: 'Cherokee',
              website: 'https://cherokee-project.com/',
              version: nil,
              description: 'Cherokee - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server:\ Cherokee/{0,1}(\d+\.\d+\.\d+\ \([a-zA-Z]{1,10}\)){0,1}$}i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x,
                                                       %r{^server:\ Cherokee/{0,1}(\d+\.\d+\.\d+\ \([a-zA-Z]{1,10}\)){0,1}$}i)
                               },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
