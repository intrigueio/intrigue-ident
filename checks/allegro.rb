module Intrigue
module Ident
module Check
class Allegro < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server","Embedded"],
        :vendor => "Allegrosoft",
        :product => "RomPager",
        :version => nil,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/Allegro-Software-RomPager\/(.*)$/i) },
        :match_type => :content_headers,
        :match_content =>  /server:\ Allegro-Software-RomPager/,
        :match_details =>"server header",
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
