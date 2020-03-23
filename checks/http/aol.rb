module Intrigue
module Ident
module Check
class AOL < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "AOL",
        :product => "AOLserver",
        :references => ["https://aolserver.github.io/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^Server:\ AOLserver\/(\d\.\d\.\d)$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^Server:\ AOLserver\/(\d\.\d\.\d)$/i) },
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end
end
end
end
end
