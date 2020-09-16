module Intrigue
  module Ident
  module Check
  class Xtermjs < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Javascript","Development"],
          :vendor => "Xtermjs",
          :product =>"Xterm.js",
          :match_details =>"include string",
          :match_type => :content_body,
          :match_content =>  /termjs:\ \'components\/xterm\.js\/xterm/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        }
      ]
    end
    
  end
  end
  end
  end
  