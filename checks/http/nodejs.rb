module Intrigue
module Ident
module Check
class Nodejs < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"Node.js",
        :product =>"Node.js",
        :match_details =>"unique error page",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /^<pre>Cannot GET \/doesntexist-123<\/pre>$/i,
        :paths => ["#{url}/doesntexist-123"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"Node.js",
        :product =>"Node.js",
        :match_details =>"unique error page",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /sails.sid=/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"Node.js",
        :product =>"Node.js",
        :match_details =>"x-powered-by (sails.js)",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-powered-by: Sails$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor =>"Sails.js",
        :product =>"Sails",
        :match_details =>"unique error page",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /sails.sid=/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor =>"Sails.js",
        :product =>"Sails",
        :match_details =>"x-powered-by header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-powered-by: Sails$/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
