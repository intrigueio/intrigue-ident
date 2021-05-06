module Intrigue
  module Ident
    module Check
      class Apache < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [ # Apache HTTP Server Test Page
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Administrative WebServer Database],
              vendor: 'Apache',
              product: 'Ambari',
              website: 'https://ambari.apache.org/',
              description: 'Apache Ambari - page title',
              version: nil,
              match_type: :content_body,
              match_content: %r{<title>Ambari</title>}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Coyote',
              website: 'https://tomcat.apache.org/tomcat-4.1-doc/config/coyote.html',
              description: 'Apache Coyote - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: /server:\ Apache[-\s]Coyote/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: Apache[-\s]Coyote/(.*)}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[ApplicationServer Administrative Database],
              vendor: 'Apache',
              product: 'Druid',
              website: 'https://druid.apache.org/',
              description: 'Apache Druid - HTML Title',
              match_type: :content_body,
              version: nil,
              match_content: %r{<title>Apache Druid</title>}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Groovy',
              website: 'https://groovy-lang.org/',
              description: 'Apache Groovy - Groovy error page',
              match_type: :content_body,
              version: nil,
              match_content: /Error processing GroovyPageView:/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            # The requested URL /doesntexist-123 was not found on this server.</p>\n<hr>\n
            # <address>Apache/2.2.15 (Red Hat) Server at jasper.emory.edu Port 443</address>
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Apache',
              product: 'HTTP Server',
              website: 'https://httpd.apache.org/',
              description: 'Apache HTTP Server - test page title',
              version: nil,
              match_type: :content_body,
              match_content: %r{<address>Apache/([\d.]+).*Server at.*</address>}i,
              dynamic_version: lambda { |x|
                _first_body_capture(x, %r{<address>Apache/([\d.]+).*Server at.*</address>}i)
              },
              paths: [{ path: "#{url}/doesntexist-123", follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Apache',
              product: 'HTTP Server',
              website: 'https://httpd.apache.org/',
              description: 'Apache HTTP Server - test page title',
              version: nil,
              match_type: :content_title,
              match_content: /Apache HTTP Server Test Page/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Apache',
              product: 'HTTP Server',
              website: 'https://httpd.apache.org/',
              description: 'Apache HTTP Server - server header w/o version',
              version: nil,
              match_type: :content_headers,
              match_content: /^server: Apache$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Apache',
              product: 'HTTP Server',
              website: 'https://httpd.apache.org/',
              description: 'Apache HTTP Server - server header - with versions',
              version: nil,
              match_type: :content_headers,
              match_content: %r{^server:.*Apache/([\d.]*)}i,
              dynamic_version: lambda { |x|
                # check for backported OS type
                backported = false
                backported = true if _first_header_match(x, /^server:.*\(CentOS\).*$/i)
                backported = true if _first_header_match(x, /^server:.*\(Red Hat\).*$/i)
                backported = true if _first_header_match(x, /^server:.*\(Red Hat Enterprise Linux\).*$/i)

                # grab the version
                version = _first_header_capture(x, %r{server:.*Apache/([\d.]*)}i)

                # return a version string that indicates we can't do inference
                return "#{version} (Backported)" if backported

                # otherwise just return the version
                version
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Apache',
              product: 'HTTP Server',
              website: 'https://httpd.apache.org/',
              description: 'Apache HTTP Server - Server Header - no version',
              version: nil,
              match_type: :content_headers,
              match_content: /^server:\ Apache$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Apache',
              product: 'HTTP Server',
              website: 'https://httpd.apache.org/',
              description: 'Apache HTTP Server - Apache generic error',
              version: nil,
              match_type: :content_body,
              match_content: /The server encountered an internal error or misconfiguration and was unable to complete your request./i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Apache',
              product: 'HTTP Server',
              website: 'https://httpd.apache.org/',
              description: 'Apache HTTP Server - Apache default page (Ubuntu)',
              version: nil,
              match_type: :content_title,
              match_content: /^Apache2 Ubuntu Default Page: It works$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              issues: ['default_web_server_page_exposed']
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Apache',
              product: 'mod_auth_kerb',
              website: 'https://sourceforge.net/projects/modauthkerb/',
              description: 'Apache mod_auth_kerb - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{^.*mod_auth_kerb/.*$}i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*mod_auth_kerb/([\w\d.\-]*)\s.*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Apache',
              product: 'mod_bwlimited',
              references: ['https://en.wikipedia.org/wiki/List_of_Apache_modules'],
              description: 'Apache mod_bwlimited - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{^.*mod_bwlimited/.*$}i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*mod_bwlimited/([\w\d.\-]*)\s.*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Apache',
              product: 'mod_fcgid',
              website: 'https://httpd.apache.org/mod_fcgid/',
              description: 'Apache mod_fcgid - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{^.*mod_fcgid/.*$}i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*mod_fcgid/([\w\d.\-]*)\s.*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Apache',
              product: 'tomcat_jk_connector',
              website: 'https://tomcat.apache.org/security-jk.html',
              description: 'Apache tomcat_jk_connector - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{^.*mod_jk/.*$}i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*mod_jk/([\w\d.\-]*)\s.*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Apache',
              product: 'mod_perl',
              website: 'https://perl.apache.org/',
              description: 'Apache mod_perl - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{^.*mod_perl/.*$}i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*mod_perl/([\w\d.\-]*)\s.*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'Apache',
              product: 'mod_ssl',
              website: 'https://httpd.apache.org/docs/current/mod/mod_ssl.html',
              description: 'Apache mod_ssl - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{^.*mod_ssl/.*$}i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*mod_ssl/([\w\d.\-]*)\s.*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Apache',
              product: 'Pivotal Web Server',
              references: ['https://webserver.docs.pivotal.io/doc/60/topics/overview.html'],
              description: 'Apache Pivotal Web Server - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server: Apache PivotalWebServer$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Sling',
              references: ['https://sling.apache.org/'],
              description: 'Apache Sling™ is a framework for RESTful web-applications based on an extensible content tree. also note that this may be related to apache experience manager',
              version: nil,
              match_type: :content_body,
              match_content: %r{<address>Apache Sling</address>}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Tomcat',
              website: 'https://tomcat.apache.org/',
              description: 'Apache Tomcat - Welcome Page Title',
              match_type: :content_title,
              version: 6,
              match_content: /Tomcat 6 Welcome Page/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Tomcat',
              website: 'https://tomcat.apache.org/',
              description: 'Apache Tomcat - Default Tomcat Home Page Reference',
              match_type: :content_body,
              version: nil,
              match_content: /this is the default Tomcat home page/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Tomcat',
              website: 'https://tomcat.apache.org/',
              description: 'Apache Tomcat - Successfully installed Tomcat Page Reference',
              match_type: :content_body,
              version: nil,
              match_content: /If you're seeing this, you've successfully installed Tomcat. Congratulations/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Tomcat',
              website: 'https://tomcat.apache.org/',
              description: 'Apache Tomcat - Default Tomcat Home Page Reference',
              match_type: :content_body,
              version: nil,
              match_content: /this is the default Tomcat home page/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Tomcat',
              website: 'https://tomcat.apache.org/',
              description: 'Apache Tomcat - Title',
              match_type: :content_title,
              version: nil,
              match_content: /Apache Tomcat/,
              dynamic_version: lambda { |x|
                _first_body_capture(x, %r{<title>(.*)</title>}, ['Apache Tomcat/', ' - Error report'])
              },
              paths: [
                { path: url.to_s, follow_redirects: true },
                { path: "#{url}/doesntexist-123", follow_redirects: true }
              ],
              inference: true
            },
            {
              type: 'fingerprint',
              require_product: 'NetWeaver',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Tomcat',
              website: 'https://tomcat.apache.org/',
              description: 'Apache Tomcat - Netweaver Tomcat Error Page',
              match_type: :content_body,
              version: nil,
              match_content: %r{Apache Tomcat/},
              dynamic_version: lambda { |x|
                _first_body_capture(x, %r{Apache Tomcat/([\d.]+)})
              },
              paths: [{ path: "#{url}/irj/portal", follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Traffic Server',
              website: 'https://trafficserver.apache.org/',
              description: 'Apache Traffic Server - Server Header',
              match_type: :content_headers,
              version: nil,
              match_content: /^server: ATS$/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'Traffic Server',
              website: 'https://trafficserver.apache.org/',
              description: 'Apache Traffic Server - Via Header',
              match_type: :content_headers,
              version: nil,
              match_content: /^via:.*ApacheTrafficServer.*$/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'NiFi',
              website: 'https://nifi.apache.org/',
              description: 'Apache Nifi - Shortcut Icon in Content Body',
              match_type: :content_body,
              version: nil,
              match_content: %r{<link rel="shortcut icon" href="images/nifi16.ico"/>},
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Apache',
              product: 'NiFi',
              website: 'https://nifi.apache.org/',
              description: 'Apache Nifi - About Title Version Page Reference',
              version: nil,
              match_type: :content_body,
              require_product: 'NiFi',
              dynamic_version: lambda { |x|
                _first_body_capture(x, /"version":"([\d.]+)"/i)
              },
              match_content: /{"about":{"title":"NiFi"/,
              paths: [{ path: "#{url}/../nifi-api/flow/about", follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Platform'],
              vendor: 'Apache',
              product: 'Solr',
              website: 'https://solr.apache.org/',
              description: 'Apache Solr - Main URL Redirect',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_code,
                  match_content: 302
                },
                {
                  match_type: :content_headers,
                  match_content: %r{Location: http(s?)://[a-zA-Z0-9\-.:]+/solr}i
                }
              ],
              paths: [
                { path: url.to_s,
                  follow_redirects: false }
              ],
              inference: false
            }
          ]
        end
      end
    end
  end
end
