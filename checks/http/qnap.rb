module Intrigue
module Ident
module Check
  class Qnap < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "hardware",
          :tags => ["Embedded", "IoT", "Appliance", "NAS"],
          :vendor => "QNAP",
          :product => "QTS",
          :match_details => "unique string",
          :version => nil,
          :match_type => :content_body,
          :match_content => /Shone added for detecting default system language when no cookie has been set/i,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "hardware",
          :tags => ["Embedded", "IoT", "Appliance", "NAS"],
          :vendor => "QNAP",
          :product => "QTS",
          :match_details => "firmware version on handy cgi page",
          :version => nil,
          :dynamic_version => lambda { |x|
            _first_body_capture(x,%r{<version><!\[CDATA\[([\d\.]*)\]\]></version>})
          },
          :match_type => :content_body,
          :match_content => /QDocRoot/,
          :paths => ["#{url}/cgi-bin/authLogin.cgi"],
          :require_product => "QTS",
          :inference => true
        }
      ]
    end
  end
end
end
end
