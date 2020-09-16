module Intrigue
module Ident
module Check
class Linksys < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Embedded","Networking"],
        :references => [
          "https://www.linksys.com/us/wireless-routers/c/smart-wi-fi-wireless-routers/"
        ],
        :vendor => "Linksys",
        :product =>"Linksys Smart Wi-Fi Service",
        :match_details =>"title",
        :match_type => :content_body,
        :match_content =>  /Linksys Smart Wi-Fi/i,
        :version => nil,
        :dynamic_version => lambda { |x|
          _first_body_capture(x,/window.location.replace\(newDomain\ \+\ \'\/ui\/(.*)\/dynamic\/login/i) 
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :credentials => [],
        # need to get the firmware version!!
        # see: https://ioactive.com/linksys-smart-wi-fi-vulnerabilities/
        # see: https://www.cvedetails.com/product-list/vendor_id-833/Linksys.html
        :inference => false 

      }
    ]
  end

end
end
end
end
