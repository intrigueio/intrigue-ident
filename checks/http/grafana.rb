module Intrigue
module Ident
module Check
  class Grafana < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["COTS","Development"],
          :vendor => "Grafana",
          :product =>"Grafana",
          :match_details =>"Grafana",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /grafana_sess/i,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end

  end
end
end
end
