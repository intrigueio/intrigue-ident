module Intrigue
module Ident
module Check
class Bootstrap < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor => "Bootstrap",
        :product => "Bootstrap",
        :match_details =>"boostrap css",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /bootstrap.min.css/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Javascript"],
        :vendor => "Twitter",
        :product => "Bootstrap",
        :match_details =>"version in js file",
        :match_type => :content_body,
        :match_content =>  /\s+\* Bootstrap v\d+\.\d+\.\d+ \(https:\/\/getbootstrap.com\/\)/i,
        :dynamic_version => lambda {|x| 
          _first_body_capture(x,/\s+\* Bootstrap v(\d+\.\d+\.\d+) \(https:\/\/getbootstrap.com\/\)/i) },
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
