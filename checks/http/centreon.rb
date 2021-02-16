module Intrigue
    module Ident
    module Check
    class Centreon < Intrigue::Ident::Check::Base
    
      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Monitoring", "Security"],
            :vendor => "Centreon",
            :product =>"Centreon",
            :match_details =>"body content",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /mailto:contact@centreon.com/i,
            :dynamic_version => lambda{|x| _first_body_capture(x,/v. (\d\.\d\.\d)/) },
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
          }
        ]
      end
    
    end
    end
    end
    end
    