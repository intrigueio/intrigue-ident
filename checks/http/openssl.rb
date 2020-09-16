module Intrigue
module Ident
module Check
  class Openssl < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Library"],
          :vendor =>"OpenSSL",
          :product =>"OpenSSL",
          :match_details =>"server header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^.*OpenSSL\/.*$/i,
          :dynamic_version => lambda { |x|         
            # check for backported OS type
            backported = false
            backported = true if _first_header_match(x,/^server:.*\(CentOS\).*$/)
            backported = true if _first_header_match(x,/^server:.*\(Red Hat\).*$/)
            backported = true if _first_header_match(x,/^server:.*\(Red Hat Enterprise Linux\).*$/)

            # grab the version
            version = _first_header_capture(x,/^.*OpenSSL\/([\w\d\.\-]*)\s.*$/i)
        
            # return a version string that indicates we can't do inference
            return "#{version} (Backported)" if backported
          
            # otherwise just return the version 
          version
          },
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => true
        }
      ]
    end

  end
end
end
end
