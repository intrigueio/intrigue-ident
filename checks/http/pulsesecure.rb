module Intrigue
module Ident
module Check
class PulseSecure < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Networking", "VPN"],
        :vendor =>"PulseSecure",
        :product =>"Pulse Connect Secure",
        :match_details => "page title",
        :match_type => :content_title,
        :references => [],
        :match_content =>  /^Junos Pulse Secure Access Service$/,
        :version => nil,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Networking", "VPN"],
        :vendor =>"PulseSecure",
        :product =>"Pulse Connect Secure",
        :match_details => "unique image link",
        :references => [
          "https://kb.pulsesecure.net/articles/Pulse_Secure_Article/KB40250",
          "https://github.com/carnal0wnage/Metasploit-Code/blob/master/modules/auxiliary/scanner/juniper_scan.rb",
          "http://carnal0wnage.attackresearch.com/2013/05/funky-juniper-urls.html" #<^ TODO ... task?
          ],
        :match_type => :content_body,
        :match_content => /<td background="\/dana-na\/imgs\/footerbg.gif">/,
        :version => nil,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Networking", "VPN"],
        :vendor =>"PulseSecure",
        :product =>"Pulse Connect Secure",
        :match_details => "unique css link",
        :references => [],
        :match_type => :content_body,
        :match_content => /src=\"\/dana-na\/css\/ds.js\">/,
        :version => nil,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :depends => [{:product => "Pulse Connect Secure"}],
        :type => "fingerprint",
        :category => "application",
        :tags => ["Networking", "VPN"],
        :vendor =>"PulseSecure",
        :product =>"Pulse Connect Secure",
        :match_details => "info disclosure in nc_gina_ver.txt",
        :references => ["https://know.bishopfox.com/blog/breaching-the-trusted-perimeter"],
        :match_type => :content_body,
        :match_content => /DSSETUP_BUILD_VERSION/,
        :version => nil,
        :dynamic_version => lambda{|x| _first_body_capture(x,/VALUE=\"Pulse Secure Network Connect ([\d\.]+)/i) }, 
        :paths => ["#{url}/dana-na/nc/nc_gina_ver.txt"],
        :require_product => "Junos Pulse Secure Access Service",
        :inference => true
      }
    ]
  end

end
end
end
end
