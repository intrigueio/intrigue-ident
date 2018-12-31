module Intrigue
module Ident
module Check
  class StiboSystems < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Application Server"],
          :vendor => "STIBO Stems",
          :product =>"STEP",
          :match_details =>"page title ",
          :version => nil,
          :references => [],
          :dynamic_version => lambda { |x|
            _first_body_capture(x,/<span id=\"versionname\">(.*)<\/span/i)
          },
          :dynamic_update => lambda { |x|
            _first_body_capture(x,/<span id=\"versionfull\">(.*)<\/span/i)
          },
          :match_type => :content_title,
          :match_content =>  /STEP by STIBO Systems/i,
          :examples => ["<title>winc-prod-azure - STEP by STIBO Systems</title>"],
          :paths => ["#{url}"]
        }
      ]
    end
  end
end
end
end
