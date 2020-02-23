module Intrigue
  module Ident
  module Check
  class Kong < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["COTS", "Appliance", "Administrative"],
          :vendor => "Kong",
          :product =>"Kong",
          :match_details =>"server header",
          :match_type => :content_headers,
          :version => nil,
          :references => [],
          :dynamic_version => lambda { |x|
            _first_header_capture(x,/^server: kong\/([\d\.]+)/i)
          },
          :match_content => /^server: kong\/[\d\.]+/i,
          :paths => ["#{url}"],
          :inference => true
        }
      ]
    end
  
  end
  end
  end
  end
  