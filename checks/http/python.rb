
module Intrigue
module Ident
module Check
class Python < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor => "Python",
        :product =>"Python",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:.*Python.*$/,
        :dynamic_version => lambda{|x| 
          _first_header_capture(x,/^server:.*Python\/([\d\.]*)\s.*$/i) },
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
