module Intrigue
  module Ident
    module Check
      class Markmonitor < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Parked'],
              vendor: 'MarkMonitor',
              product: 'MarkMonitor',
              website: 'https://markmonitor.com/',
              description: 'MarkMonitor - Protected By Title Page Reference',
              version: nil,
              match_type: :content_title,
              match_content: /^Registered &amp; Protected by MarkMonitor$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
