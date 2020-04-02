module Intrigue
  module Ident
  module Check
  class Bower < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Javascript", "Package Manager"],
          :vendor => "Bower",
          :product => "Bower",
          :match_details =>"scripts loaded via bower",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /\/bower_components\//,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  