module Intrigue
  module Ident
  module Check
  class IngramMicro < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Administrative", "Hypervisor"],
          :vendor =>"Parallels",
          :product =>"Odin Service Automation",
          :match_details => "default page title",
          :match_type => :content_title,
          :references => ["https://www.datacenterdynamics.com/en/news/ingram-micro-acquires-odin-service-automation-platform-from-parallels/"],
          :match_content => /Operations Automation Default Page/,
          :version => nil,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end
  end
  end
  end
  end
  