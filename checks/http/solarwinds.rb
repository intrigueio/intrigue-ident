module Intrigue
module Ident
module Check
class Solarwinds < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS"],
        :vendor => "Solarwinds",
        :product =>"Serv-U",
        :match_details =>"",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: Serv-U/,
        :dynamic_version => lambda {|x| _first_header_capture(x, /server: Serv-U\/([\d\.]+)/)},
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Solarwinds",
        :product =>"Nginx",
        :match_details =>"",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: solarwinds-nginx/,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
