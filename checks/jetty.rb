module Intrigue
module Ident
module Check
    class Jetty < Intrigue::Ident::Check::Base

      ###
      ### TODO - general case handled, but needs work on a bunch of edge cases
      ###

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor => "Jetty",
            :product =>"Jetty Http Server",
            :match_details =>"server header - with update",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:.*Jetty\(.*$/i,
            :dynamic_version => lambda{|x| _first_header_capture(x,/^server:.*Jetty\(([\d\.]*)\.v[\w\d\.\-]*\).*$/i) },
            :dynamic_update => lambda{|x| _first_header_capture(x,/^server:.*Jetty\([\d\.]*\.v([\w\d\.\-]*)\).*$/i) },
            :paths => ["#{url}"],
            :examples => ["server: Jetty(9.3.19.v20170502)"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor => "Jetty",
            :product =>"Jetty Http Server",
            :match_details =>"powered by header - with update",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-powered-by:.*Jetty\(.*$/i,
            :dynamic_version => lambda{|x| _first_header_capture(x,/^x-powered-by:.*Jetty\(([\d\.]*)\.v[\w\d\.\-]*\).*$/i) },
            :dynamic_update => lambda{|x| _first_header_capture(x,/^x-powered-by:.*Jetty\([\d\.]*\.v([\w\d\.\-]*)\).*$/i) },
            :paths => ["#{url}"],
            :examples => ["x-powered-by: Jetty(9.3.19.v20170502)"]
          }
        ]
      end

    end
  end
  end
  end
