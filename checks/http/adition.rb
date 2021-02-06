module Intrigue
  module Ident
    module Check
      class Adition < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["WebServer"],
              :vendor => "ADITION",
              :product => "ADITION",
              :website => "http://www.adition.com/",
              :match_details => "ADITION Web Server - Server Header",
              :version => nil,
              :match_type => :content_headers,
              :match_content => /^server: ADITIONSERVER/i,
              :dynamic_version => lambda { |x|
                version = _first_header_capture(x, /^server: ADITIONSERVER v(\d+(\.\d+)*)$/i)
              },
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
          ]
        end
      end
    end
  end
end
