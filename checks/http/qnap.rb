module Intrigue
module Ident
module Check
  class Qnap < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "hardware",
          :tags => ["Embedded", "Appliance", "NAS"],
          :vendor => "QNAP",
          :product => "NAS",
          :match_details => "firmware version",
          :version => nil,
          :dynamic_version => lambda { |x|
            _first_body_capture(x,%r{<version><!\[CDATA\[([\d\.]*)\]\]></version>})
          },
          :match_type => :content_body,
          :match_content => /QDocRoot/,
          :paths => ["#{url}/cgi-bin/authLogin.cgi"],
          :inference => false
        }
      ]
    end
  end
end
end
end
