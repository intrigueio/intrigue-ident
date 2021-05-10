module Intrigue
  module Ident
    module Check
      class Sip < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'none',
              tags: ['Web Server'],
              vendor: 'SIP',
              product: 'SIP',
              references: ['https://www.frozenmountain.com/developers/blog/archive/how-can-i-use-sip-with-webrtc/'],
              description: 'RTC server header, generic fp (skype, lync, etc)',
              version: nil,
              hide: false,
              match_type: :content_headers,
              match_content: %r{^server: RTC/[\d.]+},
              dynamic_version: ->(x) { _first_header_capture(x, %r{^server: RTC/([\d.]+)}) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
