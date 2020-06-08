module Intrigue
module Ident
module Check
module Javascript 
class Jquery < Intrigue::Ident::Check::Base
  def generate_checks(url)
    [    
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Javascript"],
        :vendor => "JQuery",
        :product =>"JQuery",
        :match_details =>"version in file",
        :match_type => :content_body,
        :match_content =>  /jQuery v\d\.\d\.\d \| \(c\) JS Foundation and other contributors/i,
        :dynamic_version => lambda {|x| 
          _first_body_capture(x,/jQuery v(\d\.\d\.\d) \| \(c\) JS Foundation and other contributors/i) },
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
end