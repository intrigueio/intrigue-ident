module Intrigue
module Ident
module Check
class Calibre < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["EBook Server","COTS"],
        :vendor =>"Calibre-Ebook",
        :product =>"Calibre",
        :match_details =>"server header",
        :references => [
          "https://github.com/kovidgoyal/calibre",
          "https://en.wikipedia.org/wiki/Calibre_(software)"
        ],
        :match_type => :content_headers,
        :match_content =>  /^server: calibre.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^server: calibre (.*)$/i)
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end

end
end
end
end
