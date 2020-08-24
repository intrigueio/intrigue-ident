module Intrigue
  module Ident
  module Check
  class Articatech < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Proxy"],
          :vendor => "Articatech",
          :product => "Artica Proxy",
          :references => ["http://artica-proxy.com/"],
          :version => nil,
          :match_details => "login redirect",
          :match_type => :content_headers,
          :match_content =>  /^location: fw.login.php$/i,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        }, 
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Proxy"],
          :vendor => "Articatech",
          :product => "Artica Proxy",
          :references => ["http://artica-proxy.com/"],
          :version => nil,
          :match_type => :content_body,
          :match_details => "login page",
          :match_content =>  /<p>Welcome to the Artica Web Administration Interface/i,
          :hide => false,
          :paths => ["#{url}"],
          :dynamic_version => lambda { |x|
              # <small>Artica 4.31.000000&nbsp;Service Pack 19 &copy; 2020</small>
            _first_body_capture(x,/<small>Artica ([\d\.]+).*<\/small>/i) },
          :dynamic_update => lambda { |x|
            _first_body_capture(x,/<small>.*Service Pack ([\d]+).*<\/small>/i) },
          :inference => false
        }, 
        
      ]
    end
  end
  end
  end
  end
  