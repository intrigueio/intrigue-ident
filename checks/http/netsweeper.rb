module Intrigue
  module Ident
  module Check
  class Netsweeeper < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Administrative"],
          :vendor => "Netsweeper",
          :product => "Netsweeper",
          :website => "https://www.netsweeper.com/",
          :match_details =>"powered by string",
          :version => nil,
          :match_type => :content_body,
          :match_content => /alt=\"Powered by netsweeper\"/i,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Administrative"],
          :vendor => "Netsweeper",
          :product => "Netsweeper",
          :match_details =>"title",
          :website => "https://www.netsweeper.com/",
          :version => nil,
          :match_type => :content_title,
          :match_content =>  /^Netsweeper WebAdmin$/i,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Administrative"],
          :vendor => "Netsweeper",
          :product => "Netsweeper",
          :website => "https://www.netsweeper.com/",
          :version => nil,
          :reference => ["https://ssd-disclosure.com/ssd-advisory-netsweeper-preauth-rce/",
          "https://portswigger.net/daily-swig/severe-rce-vulnerability-in-content-filtering-system-has-been-patched-netsweeper-says"],
          :match_type => :content_body,
          :match_details => "exposed page, fixed in current (2020) versions",
          :match_content =>  /Version: ([\d.]+)/i,
          :dynamic_version => lambda { |x| 
            _first_header_capture(x,/Version: ([\d.]+)/i) },
          :paths => ["#{url}/webadmin/tools/systemstatus_remote.php"],
          :require_product => "Netsweeper",
          :inference => false
        }
      ]
    end
  end
  end
  end
  end
  