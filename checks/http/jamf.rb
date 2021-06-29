module Intrigue
  module Ident
    module Check
      class Jamf < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Administrative', 'Login Panel', 'COTS'],
              vendor: 'Jamf',
              product: 'Pro',
              website: 'https://www.jamf.com/products/jamf-pro/',
              description: 'Jamf Pro - Login Title Page Reference',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<title>Jamf Pro Login - Jamf Pro v/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /<title>Jamf Pro Login - Jamf Pro v([\d.]*)-.*</)
                               },
              dynamic_update: lambda { |x|
                                _first_body_capture(x, /<title>Jamf Pro Login - Jamf Pro v[\d.]*-(.*)</)
                              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true,
            }
          ]
        end
      end
    end
  end
end
