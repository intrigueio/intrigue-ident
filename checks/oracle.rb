module Intrigue
module Ident
module Check
    class Oracle < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "Oracle",
            :product =>"Application Server",
            :match_details =>"server header",
            :references => [],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /Oracle-Application-Server/,
            :hide => false,
            :dynamic_version => lambda { |x|
                _first_header_capture(x,/Oracle-Application-Server-[0-9]+[a-z]?\/(.*?)\ /) },
            :paths => ["#{url}"],
            :inference => true
          },

          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "Oracle",
            :product =>"Fusion Middleware",
            :match_details =>"Web Cache Server - server header",
            :references => [],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /Oracle-Web-Cache/,
            :hide => false,
            :dynamic_version => lambda { |x|
                _first_header_capture(x,/Oracle-Web-Cache-[0-9]+[a-z]?\/(.*?)\ /) },
            :paths => ["#{url}"]
          },          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "Oracle",
            :product =>"Fusion Middleware",
            :match_details =>"page title & docs link... should give us a version",
            :version => nil,
            :dynamic_version => lambda { |x|
              doc_version = _first_body_capture(x,/download.oracle.com\/docs\/cd\/(.*?)\/index.htm/)
              case doc_version
                when "E15217_01"
                  fmw_version = "10.1.4.3"
                when "E15051_01"
                  fmw_version = "11.1.1.0"
                when "E12839_01"
                  fmw_version = "11.1.1.1"
                when "E15523_01"
                  fmw_version = "11.1.1.2"
                when "E14571_01"
                  fmw_version = "11.1.1.3"
                when "E17904_01"
                  fmw_version = "11.1.1.4"
                when "E21764_01"
                  fmw_version = "11.1.1.5"
                else
                  fmw_version = nil
              end
            fmw_version
            },
            :match_type => :content_body,
            :references => [
              "https://en.wikipedia.org/wiki/Oracle_Fusion_Middleware",
              "https://docs.oracle.com/cd/E21764_01/index.htm"
            ],
            :match_content =>  /<title>Welcome to Oracle Fusion Middleware/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "Oracle",
            :product =>"Glassfish Server",
            :match_details =>"Oracle / Sun GlassFish Enterprise Server",
            :references => [],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /Sun GlassFish Enterprise Server/,
            :hide => false,
            :dynamic_version => lambda { |x| 
              _first_header_capture(x,/Sun GlassFish Enterprise Server\sv([\d\.]+)/) 
            },
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "Oracle",
            :product =>"Glassfish Server",
            :match_details =>"Oracle / Sun GlassFish Enterprise Server",
            :references => [],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /GlassFish Server Open Source Edition/,
            :hide => false,
            :dynamic_version => lambda { |x| 
              _first_header_capture(x,/GlassFish Server Open Source Edition\s+([\d\.]+)$/) },
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor => "Oracle",
            :product =>"HTTP Server",
            :match_details =>"server header",
            :references => [],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /Oracle-HTTP-Server/,
            :hide => false,
            :dynamic_version => lambda { |x|
                _first_header_capture(x,/Oracle-HTTP-Server\/(.*?)\ /)
            },
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server","Embedded"],
            :vendor => "Oracle",
            :product =>"GoAhead Web Server",
            :match_details =>"server header",
            :references => [],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: GoAhead-Webs/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor => "Oracle",
            :product =>"iPlanet Web Server",
            :match_details =>"server header",
            :references => [],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server:\ Oracle-iPlanet-Web-Server/,
            :hide => false,
            :dynamic_version => lambda { |x|
                _first_header_capture(x,/Oracle-iPlanet-Web-Server\/(.*)/)
            },
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework", "Language"],
            :vendor => "Oracle",
            :product =>"Java",
            :match_details =>"JSESSIONID cookie",
            :references => [
              "https://javarevisited.blogspot.com/2012/08/what-is-jsessionid-in-j2ee-web.html"],
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /JSESSIONID=/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => false
          },
          { # TODO - this will tell us J2EE versions, see references!!!
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor => "Oracle",
            :product =>"Java Servlet Container",
            :match_details =>"x-header",
            :references => [
              "http://www.ntu.edu.sg/home/ehchua/programming/java/javaservlets.html"],
            :version => nil,
            :dynamic_version => lambda { |x| 
              _first_header_capture(x,/^x-powered-by: Servlet\/(.*)JSP.*$/) },
            :match_type => :content_headers,
            :match_content =>  /x-powered-by: Servlet/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => true
          },
          { # TODO - this will tell us J2EE versions, see references!!!
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor => "Oracle",
            :product =>"Java Server Container",
            :match_details =>"x-header",
            :references => ["http://www.ntu.edu.sg/home/ehchua/programming/java/javaservlets.html"],
            :version => nil,
            :dynamic_version => lambda { |x| _first_header_capture(x,/^x-powered-by: Servlet\/.*JSP\/(.*)$/) },
            :match_type => :content_headers,
            :match_content =>  /x-powered-by: Servlet\/.*JSP.*/,
            :hide => false,
            :paths => ["#{url}"],
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor => "Oracle",
            :product =>"Mojarra",
            :match_details =>"Viewstate inclusion of javaserver faces",
            :references => [
              "http://www.oracle.com/technetwork/java/javaee/javaserverfaces-139869.html",
              "http://www.oracle.com/technetwork/topics/index-090910.html",
              "https://www.owasp.org/index.php/Java_Server_Faces",
              "https://www.alphabot.com/security/blog/2017/java/Misconfigured-JSF-ViewStates-can-lead-to-severe-RCE-vulnerabilities.html"
            ],
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /javax.faces.ViewState/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor => "Oracle",
            :product =>"iPlanet Web Server",
            :match_details =>"server header",
            :references => [],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: Sun-ONE-Web-Server.*/i,
            :dynamic_version => lambda { |x| 
              _first_header_capture(x,/Server: Sun-ONE-Web-Server\/([\d\.]*).*/i) },
            :hide => false,
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "Oracle",
            :product =>"Weblogic Server",
            :match_details =>"weblogic fault / fail",
            :references => ["https://coderanch.com/t/603067/application-servers/Calling-weblogic-webservice-error"],
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<faultcode>env:WebServiceFault/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "Oracle",
            :product =>"Weblogic Server",
            :match_details =>"weblogic header",
            :references => [
              "https://support.oracle.com/knowledge/Middleware/2100514_1.html",
              "https://www.qualogy.com/techblog/oracle/how-to-harden-weblogic-and-fusion-middleware-against-worm-attacks"
            ],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-oracle-dms-ecid:/,
            :hide => false,
            :paths => ["#{url}"],
            :inference => true
          }
        ]
      end

    end
  end
  end
  end
