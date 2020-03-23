module Intrigue
module Ident
module Check
class Dell < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["OS"],
        :vendor =>"Dell",
        :product =>"KACE K1000 Systems Management Appliance",
        :match_details =>"cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /kboxid=/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server", "PaaS"],
        :vendor => "Dell",
        :product => "Dell SonicWALL Secure Mobile Access SMA",
        :references => ["https://www.sonicwall.com/products/remote-access/remote-access-appliances/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^Server:\ SonicWALL\ SSL-VPN\ Web\ Server$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^Server:\ SonicWALL\ SSL-VPN\ Web\ Server$/i) },
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
