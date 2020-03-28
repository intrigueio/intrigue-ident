module Intrigue
module Ident
module Check
class DManager < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "DManager",
        :product => "DManager",
        :references => ["http://www.dmanager.org/DManager-en.html"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ DManager$/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ DManager$/i) },
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
