
module Intrigue
module Ident
module Check
class Python < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework", "Language"],
        :vendor => "Python",
        :product =>"Python",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:.*Python.*$/,
        :dynamic_version => lambda{|x| 
          _first_header_capture(x,/^server:.*Python\/([\d\.]*).*$/i) },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework", "Language"],
        :vendor => "Python",
        :product =>"Python",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:.*CPython.*$/,
        :dynamic_version => lambda{|x| 
          _first_header_capture(x,/^server:.*CPython\/([\d\.]*).*$/i) },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Python",
        :product => "SimpleHTTP",
        :website => "https://docs.python.org/2/library/simplehttpserver.html",
        :references => [""],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /Server: SimpleHTTP.*/i,
        :dynamic_version => lambda { |x| _first_header_capture(x, /Server: SimpleHTTP\/([\d\.]+)/i)},
        :match_details => "server header",
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