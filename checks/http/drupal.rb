module Intrigue
  module Ident
    module Check
      class Drupal < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'Drupal',
              product: 'Drupal',
              references: ['https://twitter.com/bad_packets/status/1098843918127398912'],
              description: 'Drupal version in page content',
              match_type: :content_body,
              match_content: /^Drupal \d+\.\d+/,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /^Drupal ([\d.]+?)[ ,<.].*$/)
              },
              paths: [{ path: "#{url}/CHANGELOG.txt", follow_redirects: true }],
              require_product: 'Drupal',
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'Drupal',
              product: 'Drupal',
              website: 'https://www.drupal.org/',
              description: 'Drupal headers',
              version: nil,
              match_type: :content_headers,
              match_content: /x-drupal/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'Drupal',
              product: 'Drupal',
              website: 'https://www.drupal.org/',
              description: 'Drupal headers',
              version: nil,
              match_type: :content_headers,
              match_content: /x-generator: Drupal/,
              dynamic_version: lambda { |x|
                _first_header_capture(x, /x-generator: Drupal\ ([0-9]+)\ \(/i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false # Not specific enough?
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'Drupal',
              product: 'Drupal',
              website: 'https://www.drupal.org/',
              description: 'generator tag',
              version: 7,
              match_type: :content_generator,
              match_content: %r{Drupal 7 \(http://drupal.org\)},
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false # Not specific enough?
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'Drupal',
              product: 'Drupal',
              website: 'https://www.drupal.org/',
              description: 'generator tag',
              version: 8,
              match_type: :content_generator,
              match_content: %r{Drupal 8 \(http://drupal.org\)},
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false # Not specific enough?
            }
          ]
        end
      end
    end
  end
end
