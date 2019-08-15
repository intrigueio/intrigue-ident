module Intrigue
module Ident
module Check
  class Webmin < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Administrative"],
          :vendor =>"Webmin",
          :product =>"Webmin",
          :match_details => "miniserv server",
          :match_type => :content_headers,
          :references => [],
          :match_content => /server: MiniServ/,
          :version => nil,
          :dynamic_version => lambda { |x| 
            _first_header_capture(x,/server: MiniServ\/(.*)/)},
          :paths => ["#{url}"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Administrative"],
          :vendor =>"Webmin",
          :product =>"Webmin",
          :match_details => "page title",
          :match_type => :content_body,
          :references => [],
          :match_content => /<title>Login to Webmin/,
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
