module Intrigue
module Ident
module Check
    class Communigate < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :vendor => "CommuniGate Systems",
            :type => "application",
            :product =>"CommuniGatePro",
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
