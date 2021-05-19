module Intrigue
  module Ident
    module Check
      class Blueimp < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['JavaScript'],
              vendor: 'blueimp',
              product: 'jQuery-File-Upload',
              website: 'https://github.com/blueimp/jQuery-File-Upload',
              description: 'match string in the page',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /jquery.fileupload/i,
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
