module Intrigue
module Ident
module Check
  class Gunicorn < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["COTS","Development"],
          :vendor => "Gunicorn",
          :product =>"Gunicorn",
          :match_details =>"server",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /server: gunicorn/i,
          :dynamic_version => lambda{ |x|
            _first_header_capture(x,/server: gunicorn\/(.*)/)
          },
          :paths => ["#{url}"],
          :inference => true
        }
      ]
    end

  end
end
end
end
