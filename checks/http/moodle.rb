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
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor =>"Moodle",
            :product =>"Moodle",
            :match_details =>"Version detection via /lib/upgrade.txt",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /This files describes API changes in core libraries and APIs/i,
            :paths => [ { :path  => "#{url}/lib/upgrade.txt", :follow_redirects => true } ],
            :inference => true,
            :require_product => "Moodle",
            :dynamic_version => lambda {
              |x|
              _first_body_capture(x, /\=\=\= (\d+(\.\d+)*) \=\=\=/i)
            },
          }
        ]
      end
  
    end
  end
  end
  end
  