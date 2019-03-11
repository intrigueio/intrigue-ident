module Intrigue
module Ident
module Check
class Apache < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative", "Web Server", "Database"],
        :vendor => "Apache",
        :product =>"Ambari",
        :match_details =>"page title",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /<title>Ambari<\/title>/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Apache",
        :product =>"Coyote",
        :match_details =>"Apache coyote application server - server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server:\ Apache-Coyote/i,
        :dynamic_version_field => "headers",
        :dynamic_version_regex => /server: Apache-Coyote\/(.*)/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/server: Apache-Coyote\/(.*)/i)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Apache",
        :product =>"Groovy",
        :match_details =>"Groovy error page",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /Error processing GroovyPageView:/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Apache",
        :product =>"HTTP Server",
        :match_details =>"Apache web server - server header - with versions",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:.*Apache\/([\d\.]*).*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/server:.*Apache\/([\d\.]*).*/)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Apache",
        :product =>"HTTP Server",
        :match_details =>"Apache web server - server header - no version",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ Apache$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Apache",
        :product =>"HTTP Server",
        :match_details =>"Apache generic error",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /The server encountered an internal error or misconfiguration and was unable to complete your request./i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"Apache",
        :product =>"mod_auth_kerb",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^.*mod_auth_kerb\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^.*mod_auth_kerb\/([\w\d\.\-]*)\s.*$/i)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"Apache",
        :product =>"mod_bwlimited",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^.*mod_bwlimited\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^.*mod_bwlimited\/([\w\d\.\-]*)\s.*$/i)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"Apache",
        :product =>"mod_fcgid",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^.*mod_fcgid\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^.*mod_fcgid\/([\w\d\.\-]*)\s.*$/i)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"Apache",
        :product =>"mod_jk",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^.*mod_jk\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^.*mod_jk\/([\w\d\.\-]*)\s.*$/i)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"Apache",
        :product =>"mod_perl",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^.*mod_perl\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^.*mod_perl\/([\w\d\.\-]*)\s.*$/i)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"Apache",
        :product =>"mod_ssl",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^.*mod_ssl\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^.*mod_ssl\/([\w\d\.\-]*)\s.*$/i)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"Apache",
        :product =>"mod_wsgi",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^.*mod_wsgi\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^.*mod_wsgi\/([\w\d\.\-]*)\s.*$/i)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor =>"Apache",
        :product =>"PivotalWebServer",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: Apache PivotalWebServer$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Apache",
        :product =>"Sling",
        :references => ["https://sling.apache.org/"],
        :match_details =>"Apache Sling™ is a framework for RESTful web-applications based on an extensible content tree. also note that this may be related to apache experience manager",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /<address>Apache Sling<\/address>/i,
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Apache",
        :product => "Tomcat",
        :match_details =>"Tomcat Application Server",
        :match_type => :content_body,
        :version => 6,
        :match_content =>  /<title>Tomcat 6 Welcome Page/,
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Apache",
        :product => "Tomcat",
        :match_details =>"Tomcat Application Server",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /<title>Apache Tomcat/,
        :dynamic_version_field => "title",
        :dynamic_version_regex => /Apache Tomcat\/(.*?) - Error report/i,
        :dynamic_version => lambda{ |x|
          _first_body_capture(x, /<title>(.*)<\/title>/,["Apache Tomcat/"," - Error report"])
        },
        :paths => ["#{url}","#{url}/doesntexist-123"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Apache",
        :product => "Traffic Server",
        :match_details =>"header",
        :match_type => :content_headers,
        :version => nil,
        :match_content =>  /^server: ATS$/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Apache",
        :product => "Traffic Server",
        :match_details =>"header",
        :match_type => :content_headers,
        :version => nil,
        :match_content =>  /^via:.*ApacheTrafficServer.*$/,
        :paths => ["#{url}"],
        :inference => false
      }
      
    ]
  end
end
end
end
end
