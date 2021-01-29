module Intrigue
  module Ident
  module Check
  class Powerkit < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Wordpress Plugin"],
          :vendor =>"Code Supply Co",
          :product =>"Powerkit",
          :references => ["https://wordpress.org/plugins/powerkit/"],
          :version => nil,
          :match_type => :content_body,
          :match_content => /powerkit\.css\?ver=/i,
          :dynamic_version => lambda { |x| 
            _first_body_capture(x, /powerkit\.css\?ver=([\d\.]+)/i)},
          :match_details =>"header match",
          :hide => false,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :require_product => "Wordpress",
          :inference => false
        }
      ]
    end
    
  end
  end
  end
  end
  