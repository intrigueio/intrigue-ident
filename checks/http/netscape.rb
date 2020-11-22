module Intrigue
module Ident
module Check
class Netscape < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer"],
        :vendor => "Netscape",
        :product =>"Enterprise Server",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /Server: Netscape-Enterprise.*/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/Server: Netscape-Enterprise\/([\d\.]*).*/i) },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end

end
end
end
end
