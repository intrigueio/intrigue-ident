module Intrigue
  module Ident
    module Check
      class Oracle < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Oracle',
              product: 'Access Management',
              description: 'cookie',
              references: ['https://docs.oracle.com/cd/E52734_01/oam/AIAAG/GUID-5FD1A6DD-5EE7-4D22-9336-915C62B46C8F.htm#AIAAG297'],
              version: nil,
              match_type: :content_cookies,
              match_content: /ObSSOCookie=/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              hide: false,
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Oracle',
              product: 'Application Server',
              description: 'server header',
              references: [],
              version: nil,
              match_type: :content_headers,
              match_content: /Oracle-Application-Server/,
              hide: false,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{Oracle-Application-Server-[0-9]+[a-z]?/(.*?)\ })
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Oracle',
              product: 'Fusion Middleware',
              description: 'Web Cache Server - server header',
              references: [],
              version: nil,
              match_type: :content_headers,
              match_content: /Oracle-Web-Cache/,
              hide: false,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{Oracle-Web-Cache-[0-9]+[a-z]?/(.*?)\ })
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Oracle',
              product: 'Fusion Middleware',
              description: 'page title & docs link... should give us a version',
              version: nil,
              dynamic_version: lambda { |x|
                doc_version = _first_body_capture(x, %r{download.oracle.com/docs/cd/(.*?)/index.htm})
                fmw_version = case doc_version
                              when 'E15217_01'
                                '10.1.4.3'
                              when 'E15051_01'
                                '11.1.1.0'
                              when 'E12839_01'
                                '11.1.1.1'
                              when 'E15523_01'
                                '11.1.1.2'
                              when 'E14571_01'
                                '11.1.1.3'
                              when 'E17904_01'
                                '11.1.1.4'
                              when 'E21764_01'
                                '11.1.1.5'
                              end
                fmw_version
              },
              match_type: :content_body,
              references: [
                'https://en.wikipedia.org/wiki/Oracle_Fusion_Middleware',
                'https://docs.oracle.com/cd/E21764_01/index.htm'
              ],
              match_content: /<title>Welcome to Oracle Fusion Middleware/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Oracle',
              product: 'Glassfish Server',
              description: 'Oracle / Sun GlassFish Enterprise Server',
              references: [],
              version: nil,
              match_type: :content_headers,
              match_content: /Sun GlassFish Enterprise Server/,
              hide: false,
              dynamic_version: lambda { |x|
                _first_header_capture(x, /Sun GlassFish Enterprise Server\sv([\d.]+)/)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Oracle',
              product: 'Glassfish Server',
              description: 'Oracle / Sun GlassFish Enterprise Server',
              references: [],
              version: nil,
              match_type: :content_headers,
              match_content: /GlassFish Server Open Source Edition/,
              hide: false,
              dynamic_version: lambda { |x|
                _first_header_capture(x, /GlassFish Server Open Source Edition\s+([\d.]+)$/)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Oracle',
              product: 'HTTP Server',
              description: 'server header',
              references: [],
              version: nil,
              match_type: :content_headers,
              match_content: /Oracle-HTTP-Server/,
              hide: false,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{Oracle-HTTP-Server/(.*?)\ })
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'Embedded'],
              vendor: 'Oracle',
              product: 'GoAhead Web Server',
              description: 'server header',
              references: [],
              version: nil,
              match_type: :content_headers,
              match_content: /server: GoAhead-Webs/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Oracle',
              product: 'iPlanet Web Server',
              description: 'server header',
              references: [],
              version: nil,
              match_type: :content_headers,
              match_content: /server:\ Oracle-iPlanet-Web-Server/i,
              hide: false,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server:\ Oracle-iPlanet-Web-Server/(.*)}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Oracle',
              product: 'Java',
              description: 'JSESSIONID cookie',
              references: [
                'https://javarevisited.blogspot.com/2012/08/what-is-jsessionid-in-j2ee-web.html'
              ],
              version: nil,
              match_type: :content_cookies,
              match_content: /JSESSIONID=/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            { ### SPECIFIC TO SAP
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Oracle',
              product: 'Java',
              description: 'server header',
              references: [],
              match_type: :content_headers,
              match_content: %r{server: SAP NetWeaver Application Server [\d.]+ / AS Java [\d.]+}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x,
                                                       %r{AP NetWeaver Application Server [\d.]+ / AS Java ([\d.]+)}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            { # TODO: - this will tell us J2EE versions, see references!!!
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Oracle',
              product: 'Java Servlet Container',
              description: 'x-header',
              references: [
                'http://www.ntu.edu.sg/home/ehchua/programming/java/javaservlets.html'
              ],
              version: nil,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^x-powered-by: Servlet/(.*)JSP.*$})
              },
              match_type: :content_headers,
              match_content: /x-powered-by: Servlet/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            { # TODO: - this will tell us J2EE versions, see references!!!
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Oracle',
              product: 'Java Server Container',
              description: 'x-header',
              references: ['http://www.ntu.edu.sg/home/ehchua/programming/java/javaservlets.html'],
              version: nil,
              dynamic_version: ->(x) { _first_header_capture(x, %r{^x-powered-by: Servlet/.*JSP/(.*)$}) },
              match_type: :content_headers,
              match_content: %r{x-powered-by: Servlet/.*JSP.*},
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Oracle',
              product: 'Mojarra',
              description: 'Viewstate inclusion of javaserver faces',
              references: [
                'http://www.oracle.com/technetwork/java/javaee/javaserverfaces-139869.html',
                'http://www.oracle.com/technetwork/topics/index-090910.html',
                'https://www.owasp.org/index.php/Java_Server_Faces',
                'https://www.alphabot.com/security/blog/2017/java/Misconfigured-JSF-ViewStates-can-lead-to-severe-RCE-vulnerabilities.html'
              ],
              version: nil,
              match_type: :content_body,
              match_content: /javax.faces.ViewState/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Oracle',
              product: 'iPlanet Web Server',
              description: 'server header',
              references: [],
              version: nil,
              match_type: :content_headers,
              match_content: /server: Sun-ONE-Web-Server.*/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{Server: Sun-ONE-Web-Server/([\d.]*).*}i)
              },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Oracle',
              product: 'Weblogic Server',
              description: 'weblogic fault / fail',
              references: ['https://coderanch.com/t/603067/application-servers/Calling-weblogic-webservice-error'],
              version: nil,
              match_type: :content_body,
              match_content: /<faultcode>env:WebServiceFault/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'Oracle',
              product: 'Weblogic Server',
              website: 'https://www.oracle.com/uk/java/weblogic/',
              description: 'generator tag',
              version: nil,
              match_type: :content_generator,
              match_content: /^WebLogic Server$/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Monitoring'],
              vendor: 'Oracle',
              product: 'Dynamic Monitoring Service',
              description: 'Oracle Dynamic Monitoring Service - x-oracle-dms-ecid header ',
              references: [
                'https://docs.oracle.com/cd/E21764_01/core.1111/e10108/dms.htm#ASPER295',
                'https://support.oracle.com/knowledge/Middleware/2100514_1.html',
                'https://www.qualogy.com/techblog/oracle/how-to-harden-weblogic-and-fusion-middleware-against-worm-attacks'
              ],
              version: nil,
              match_type: :content_headers,
              match_content: /^x-oracle-dms-ecid:/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
