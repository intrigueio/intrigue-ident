module Intrigue
module Ident
module Check
class Appdynamics < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["APM", "Javascript"],
        :website => "https://www.appdynamics.com/",
        :vendor => "AppDynamics",
        :product => "AppDynamics",
        :version => nil,
        :match_type => :content_cookies,
        :match_details =>"",
        :match_content =>  /ADRUM_BTa=/,
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["APM", "Javascript"],
        :website => "https://www.appdynamics.com/",
        :vendor => "AppDynamics",
        :product => "AppDynamics",
        :version => nil,
        :match_type => :content_cookies,
        :match_details =>"",
        :match_content =>  /ADRUM_BT1=/,
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
