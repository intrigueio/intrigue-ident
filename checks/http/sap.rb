module Intrigue
  module Ident
    module Check
      class Sap < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'SAP',
              product: 'Advanced Business Application Programming',
              description: 'server header',
              references: [
                'https://en.wikipedia.org/wiki/ABAP'
              ],
              version: nil,
              match_type: :content_headers,
              match_content: %r{server: SAP NetWeaver Application Server [\d.\s]*/ ABAP \d+}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x,
                                                       %r{server: SAP NetWeaver Application Server [\d.\s]*/ ABAP (\d+)}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'SAP',
              product: 'Internet Communication Manager',
              description: 'server header',
              references: [
                'https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/48/039d48c0070c84e10000000a42189c/frameset.htm'
              ],
              version: nil,
              match_type: :content_headers,
              match_content: %r{server: SAP NetWeaver Application Server [\d.\s]*/ ICM [\d.]+}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x,
                                                       %r{server: SAP NetWeaver Application Server [\d.\s]*/ ICM ([\d.]+)}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            { ### TODO... can we get a version out of this? # SAP Netweaver default creds - SAP*/06071992 or TMSADM/$1Pawd2&
              type: 'fingerprint',
              require_product: 'NetWeaver',
              category: 'application',
              tags: ['Application Server', 'Login Panel'],
              vendor: 'SAP',
              product: 'NetWeaver',
              website: 'https://www.sap.com/products/netweaver-platform.html',
              references: ['https://apps.support.sap.com/sap/support/knowledge/en/1749574'],
              description: 'SAP NetWeaver - Login panel page reference.',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /SAP&#x20;NetWeaver&#x20;Portal/i,
                },
                {
                  match_type: :content_title,
                  match_content: /SAP NetWeaver Application Server/i,
                }
              ],
              dynamic_version: ->(x) { 
                _first_header_capture(x, /SAP NetWeaver Application Server (\d+(\.\d+)*)/i) 
              },
              paths: [
                { path: url.to_s, follow_redirects: true },
                { path: "#{url}/irj/portal", follow_redirects: true }
              ],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'NetWeaver',
              description: 'saplb cookie',
              version: nil,
              references: ['https://apps.support.sap.com/sap/support/knowledge/en/1749574'],
              match_type: :content_cookies,
              match_content: /saplb_\*=/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'NetWeaver',
              description: 'portalalias cookie',
              version: nil,
              website: 'https://www.sap.com/uk/products/netweaver-platform.html',
              match_type: :content_cookies,
              match_content: /PortalAlias=/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'NetWeaver',
              description: 'com.sap.engine.security.authentication.original_application_url cookie',
              version: nil,
              website: 'https://www.sap.com/uk/products/netweaver-platform.html',
              match_type: :content_cookies,
              match_content: /com.sap.engine.security.authentication.original_application_url=/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              require_product: 'NetWeaver',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'NetWeaver',
              description: 'LM Configuration Wizard detection',
              version: nil,
              references: ['https://apps.support.sap.com/sap/support/knowledge/en/1749574'],
              match_type: :content_body,
              match_content: /urn:CTCWebServiceSi/i,
              paths: [{ path: "#{url}/CTCWebService/CTCWebServiceBean?wsdl", follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'NetWeaver',
              description: 'cookie',
              version: nil,
              references: [
                'https://apps.support.sap.com/sap/support/knowledge/preview/en/2082323',
                'https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/sap/sap_soap_rfc_pfl_check_os_file_existence.rb'
              ],
              match_type: :content_cookies,
              match_content: /sap-usercontext=/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'NetWeaver',
              description: 'cookie',
              version: nil,
              references: [],
              match_type: :content_cookies,
              match_content: /com.sap.engine.security.authentication.original_application_url/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'NetWeaver',
              website: 'https://www.sap.com/uk/products/netweaver-platform.html',
              version: nil,
              description: 'server header',
              match_type: :content_headers,
              match_content: /^server: SAP NetWeaver Application Server/i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /^server: SAP NetWeaver Application Server (\d+(\.\d+)*)/i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'NetWeaver',
              version: nil,
              description: 'location header',
              references: [
                'https://blogs.sap.com/2016/05/19/hp-loadrunner-scripts-for-webui/'
              ],
              match_type: :content_headers,
              match_content: /bD1lbiZjPTEwMCZkPW1pbg==/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'XSEngine',
              references: ['https://help.sap.com/viewer/6b94445c94ae495c83a19646e7c3fd56/2.0.04/en-US/e8b56a8a904a4a9d9bfa7fa76aec5674.html'],
              version: nil,
              description: 'title',
              match_type: :content_title,
              match_content: /SAP XSEngine/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server', 'Login Panel'],
              vendor: 'SAP',
              product: 'Solution Manager',
              website: 'https://support.sap.com/en/alm/solution-manager.html',
              references: 'https://www.exploit-db.com/ghdb/6793',
              version: nil,
              description: 'login details in response body',
              match_type: :content_body,
              match_content: /<form.*name="loginForm".*action=".*FioriLaunchpad\.html.*/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'Solution Manager',
              website: 'https://support.sap.com/en/alm/solution-manager.html',
              version: nil,
              description: 'redirect to login',
              match_type: :content_headers,
              match_content: /location:.*FioriLaunchpad\.html/i,
              paths: [{ path: url.to_s, follow_redirects: false }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server', 'Login Panel'],
              vendor: 'SAP',
              product: 'Focused Run',
              website: 'https://support.sap.com/en/alm/sap-focused-run.html',
              references: 'https://www.exploit-db.com/ghdb/6793',
              version: nil,
              match_type: :content_body,
              match_content: %r{<form.*name="loginForm".*action="/sap/bc/ui2/flp".*}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'SAP',
              product: 'Focused Run',
              website: 'https://support.sap.com/en/alm/sap-focused-run.html',
              version: nil,
              description: 'redirect to login',
              match_type: :content_headers,
              match_content: %r{location:.*/sap/bc/ui2/flp}i,
              paths: [{ path: url.to_s, follow_redirects: false }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
