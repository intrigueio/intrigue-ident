module Intrigue
module Ident
module Check
class NiSource < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer"],
        :vendor => "NiSource",
        :product => "NiSource",
        :references => ["https://www.nisource.com/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ NiSource$/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ NiSource$/i) },
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end
end
end
end
end
