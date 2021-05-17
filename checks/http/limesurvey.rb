module Intrigue
  module Ident
    module Check
      class LimeSurvey < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['COTS', 'Website'],
              vendor: 'LimeSurvey',
              product: 'LimeSurvey',
              website: 'https://www.limesurvey.org/',
              description: 'LimeSurvey',
              match_type: :content_body,
              version: nil,
              match_content: /Donate to LimeSurvey/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
