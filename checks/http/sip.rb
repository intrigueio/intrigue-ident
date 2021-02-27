module Intrigue
  module Ident
  module Check
  class Sip < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "none",
          vendor: "SIP",
          product: "SIP",
          description:"RTC server header, generic fp (skype, lync, etc)",
          version: nil,
          hide: false,
          match_type: :content_headers,
          match_content:  /^server: RTC\/[\d\.]+/,
          dynamic_version: lambda { |x| _first_header_capture(x,/^server: RTC\/([\d\.]+)/)},
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        }
      ]
    end
  
  end
  end
  end
  end
  