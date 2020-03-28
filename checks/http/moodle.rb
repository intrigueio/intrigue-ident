module Intrigue
  module Ident
  module Check
    class Moodle < Intrigue::Ident::Check::Base
  
      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor =>"Moodle",
            :product =>"Moodle",
            :match_details =>"cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /MoodleSession=/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end
  
    end
  end
  end
  end
  