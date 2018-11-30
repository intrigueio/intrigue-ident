module Intrigue
module Ident
module Check
    class Communigate < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :vendor => "Stalker", # recently renamed to communigate systems inc
            :category => "application",
            :tags => ["COTS","Marketing"],
            :product =>"CommuniGate Pro",
            :website => "http://www.stalker.com/CommuniGatepro/",
            :match_details =>"server header",
            :version => nil,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/server: CommuniGatePro\/(.*)/i,)
            },
            :match_type => :content_headers,
            :match_content => /server: CommuniGatePro\/6.2.6/,
            :hide => false,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
