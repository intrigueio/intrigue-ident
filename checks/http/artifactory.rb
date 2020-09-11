module Intrigue
module Ident
module Check
class Artifactory < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Development", "Security"],
        :website => "https://jfrog.com/artifactory/",
        :vendor => "Jfrog",
        :product => "Artifactory",
        :version => nil,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/server: Artifactory\/(.*)$/i) },
        :match_type => :content_headers,
        :match_content =>  /server: Artifactory/,
        :match_details =>"server header",
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Development", "Security"],
        :website => "https://jfrog.com/artifactory/",
        :vendor => "Jfrog",
        :product => "Artifactory",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /\;URL\=\/artifactory/,
        :match_details =>"redirect in the body",
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
  
end
end
end
end
