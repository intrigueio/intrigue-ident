module Intrigue
  module Ident
    module Check
      class Microsoft < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Microsoft',
              product: 'ASP.NET Default Application',
              website: 'https://dotnet.microsoft.com/apps/aspnet',
              description: 'unique string',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Home Page - My ASP.NET Application/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Microsoft',
              product: 'ASP.NET',
              website: 'https://dotnet.microsoft.com/apps/aspnet',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /^.*ASP.NET is configured*$/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /ASP.NET Version:\ ([\d.]*)/i)
                               },
              description: 'ASP.Net Error Message',
              paths: [
                { path: url.to_s, follow_redirects: true },
                { path: "#{url}/doesntexist-123", follow_redirects: true }
              ],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Microsoft',
              product: 'ASP.NET',
              website: 'https://dotnet.microsoft.com/apps/aspnet',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-aspnet-version:.*$/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /^x-aspnet-version:\ ([\d.]*)/i)
                               },
              description: 'X-AspNet Header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Microsoft',
              product: 'ASP.NET',
              website: 'https://dotnet.microsoft.com/apps/aspnet',
              description: 'Microsoft ASP.NET - Cookies Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /ASPSESSIONID.*$/i,
                },
                {
                  match_type: :content_cookies,
                  match_content: /AspNetCore.Antiforgery/i,
                },
                {
                  match_type: :content_cookies,
                  match_content: /ASP.NET_SessionId.*$/i,
                },
                {
                  match_type: :content_cookies,
                  match_content: /ASPXAUTH=/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Microsoft',
              product: 'ASP.NET MVC',
              website: 'https://dotnet.microsoft.com/apps/aspnet/mvc',
              description: 'ASP.Net MVC Header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                match_type: :content_headers,
                match_content: /x-aspnetmvc-version/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /^x-aspnetmvc-version:\s([\d.]+)/i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            # {
            #  TODO. Not the same as MVC version
            #  type: "fingerprint",
            #  category: "application",
            #  tags: ["Web Framework"],
            #  vendor: "Microsoft",
            #  product:"ASP.NET Core",
            #  description:"Asp.Net MVC Header",
            #  version: nil,
            #  dynamic_version: lambda{ |x|
            #    _first_header_capture(x,/^x-aspnetmvc-version:\s([\d\.]+)/i) },
            #  match_type: :content_headers,
            #  match_content: /x-aspnetmvc-version/i,
            #  paths: [ { path: "#{url}", follow_redirects: true } ],
            #  inference: true
            # },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Microsoft',
              product: 'ASP.NET',
              website: 'https://dotnet.microsoft.com/apps/aspnet',
              description: 'Microsoft ASP.NET - Body Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /WebResource.axd?d=/i,
                },
                {
                  match_type: :content_body,
                  match_content: /__VIEWSTATEGENERATOR/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Microsoft',
              product: '.NET Framework',
              website: 'https://dotnet.microsoft.com/',
              description: 'trace.axd version',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Microsoft \.NET Framework Version/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, /ASP.NET Version:([\d.]*)/)
              },
              paths: [{ path: "#{url}/Trace.axd", follow_redirects: true }],
              require_product: 'ASP.NET',
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Hosting IaaS],
              vendor: 'Microsoft',
              product: 'Azure',
              website: 'https://azure.microsoft.com/',
              description: 'standard 404',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Microsoft Azure Web App - Error 404$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              hide: true,
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Hosting', 'IaaS'],
              vendor: 'Microsoft',
              product: 'Azure',
              website: 'https://azure.microsoft.com/',
              description: 'Microsoft Azure - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-msedge-ref:.*/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-ms-ref:.*/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-ms-request-id:.*/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Hosting IaaS],
              vendor: 'Microsoft',
              product: 'Azure',
              website: 'https://azure.microsoft.com/',
              description: 'proxy default error',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<h2>Our services aren't available right now</h2><p>We're working to restore all services as soon as possible. Please check back soon}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              hide: true,
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Hosting', 'IaaS'],
              vendor: 'Microsoft',
              product: 'Azure',
              website: 'https://azure.microsoft.com/',
              description: 'Microsoft Azure - Cookies Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /ApplicationGatewayAffinity=/i,
                },
                {
                  match_type: :content_cookies,
                  match_content: /ApplicationGatewayAffinityCORS=/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN IaaS],
              vendor: 'Microsoft',
              product: 'Verizon Azure CDN',
              references: [
                'https://docs.microsoft.com/en-us/azure/cdn/cdn-verizon-http-headers',
                'https://docs.vdms.com/cdn/Content/HTTP_and_HTTPS_Data_Delivery/Response.htm'
              ],
              version: nil,
              description: 'Microsoft Verizon Azure CDN - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server:\ (ECAcc|ECD|EOS|ECS)\ \([a-zA-Z]{3}/[a-zA-Z0-9]{4}\)$}i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x,
                                                       %r{^server:\ (ECAcc|ECD|EOS|ECS)\ \([a-zA-Z]{3}/[a-zA-Z0-9]{4}\)$}i)
                               },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Microsoft',
              product: 'ASP.NET',
              website: 'https://dotnet.microsoft.com/apps/aspnet',
              description: 'powered by header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-Powered-By: ASP.NET$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS'],
              vendor: 'Microsoft',
              product: 'Commerce Server',
              website: 'https://www.sitecore.com/products/sitecore-commerce',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /commerce-server-software: Microsoft Commerce Server.*/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'COTS', 'Mail Server', 'Email'],
              vendor: 'Microsoft',
              product: 'Exchange Server',
              references: ['https://support.microsoft.com/en-us/help/4036163/you-can-t-access-owa-or-ecp-after-you-install-exchange-server-2016-cu6'],
              description: 'Microsoft Exchange Server - Headers Match',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-feserver:.*$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: %r{^location:.*/owa/$}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'COTS', 'Mail Server', 'Email'],
              vendor: 'Microsoft',
              product: 'Exchange Server',
              website: 'https://www.microsoft.com/en-gb/microsoft-365/exchange/email',
              description: 'OWA Header -> Exchange server inference',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-owa-version:/i,
                }
              ],
              dynamic_version: lambda { |x|
                version_string = _first_header_capture(x, /^x-owa-version:(.*)$/i)
                owa_to_exchange_version(version_string)[:version]
              },
              dynamic_update: lambda { |x|
                update_string = _first_header_capture(x, /^x-owa-version:(.*)$/i)
                owa_to_exchange_version(update_string)[:update]
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'COTS', 'Mail Server', 'Email'],
              vendor: 'Microsoft',
              product: 'Exchange Server',
              references: ['https://bit.ly/2k4Yoot'],
              description: 'OWA version -> Exchange server inference (body)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /OwaPage\ =\ ASP.auth_logon_aspx/i,
                }
              ],
              dynamic_version: lambda { |x|
                version_string = _first_body_capture(x, %r{href="/owa/auth/([\d.]+)/themes/resources/favicon.ico})
                version_string ||= _first_body_capture(x,
                                                       %r{href="/owa/([\d.]+)/themes/resources/favicon.ico})

                owa_to_exchange_version(version_string)[:version]
              },
              dynamic_update: lambda { |x|
                update_string = _first_body_capture(x, %r{href="/owa/auth/([\d.]+)/themes/resources/favicon.ico})
                update_string ||= _first_body_capture(x,
                                                      %r{href="/owa/([\d.]+)/themes/resources/favicon.ico})

                owa_to_exchange_version(update_string)[:update]
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true # TODO: - not specific enough yet
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'COTS', 'Mail Server', 'Email'],
              vendor: 'Microsoft',
              product: 'Exchange Server',
              references: ['https://bit.ly/2k4Yoot'],
              description: 'OWA version -> Exchange server inference (headers)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-owa-version/i,
                }
              ],
              dynamic_version: lambda { |x|
                version_string = _first_body_capture(x, %r{href="/owa/auth/([\d.]+)/themes/resources/favicon.ico})
                version_string ||= _first_body_capture(x,
                                                       %r{href="/owa/([\d.]+)/themes/resources/favicon.ico})

                owa_to_exchange_version(version_string)[:version]
              },
              dynamic_update: lambda { |x|
                update_string = _first_body_capture(x, %r{href="/owa/auth/([\d.]+)/themes/resources/favicon.ico})
                update_string ||= _first_body_capture(x,
                                                      %r{href="/owa/([\d.]+)/themes/resources/favicon.ico})

                owa_to_exchange_version(update_string)[:update]
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true # TODO: - not specific enough yet
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Firewall'],
              vendor: 'Microsoft',
              product: 'Forefront TMG',
              website: 'http://www.microsoft.com/tmg',
              description: 'Microsoft Forefront Threat Management Gateway',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /<title>Microsoft Forefront TMG/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Firewall'],
              vendor: 'Microsoft',
              product: 'Forefront TMG',
              website: 'http://www.microsoft.com/tmg',
              description: 'Microsoft Forefront Threat Management Gateway',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /via:\ 1.1\ TMGSRVR/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Firewall'],
              vendor: 'Microsoft',
              product: 'ISA Server',
              website: 'http://www.microsoft.com/tmg',
              version: '2006',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Microsoft ISA Server 2006$/i,
                }
              ],
              description: 'standard title',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library', 'Application Server'],
              vendor: 'Microsoft',
              product: 'Frontpage',
              references: ['https://en.wikipedia.org/wiki/Microsoft_FrontPage'],
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^.*FrontPage/.*$}i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*FrontPage/([\d.]*).*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'DefaultPage'],
              vendor: 'Microsoft',
              product: 'Internet Information Services',
              website: 'https://www.iis.net/',
              description: 'default page image',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{\<img\ src=\"iisstart\.png\"},
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'DefaultPage'],
              vendor: 'Microsoft',
              product: 'Internet Information Services',
              website: 'https://www.iis.net/',
              description: 'default page title',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: %r{^IIS Windows$},
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Microsoft',
              product: 'Internet Information Services',
              website: 'https://www.iis.net/',
              description: 'server header',
              version: nil,
              dynamic_version: lambda { |x|
                _first_header_capture x, %r{server: Microsoft-IIS/(.*)}
              },
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{server: Microsoft-IIS/},
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false # not specific enough
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Microsoft',
              product: 'Internet Information Services',
              website: 'https://www.iis.net/',
              description: 'body error messages',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /401.2 - Unauthorized: Access is denied due to server configuration.<br>Internet Information Services \(IIS\)/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false # not specific enough
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Microsoft',
              product: 'Internet Information Services',
              website: 'https://www.iis.net/',
              description: 'Internet Information Services',
              version: '8.0',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<img src="iis-8.png"/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false # not specific enough
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Microsoft',
              product: 'Internet Information Services',
              website: 'https://www.iis.net/',
              description: 'Microsoft IIS 8.5',
              version: '8.5',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<img src="iis-85.png"/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false # not specific enough
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Microsoft',
              product: 'Internet Information Services',
              website: 'https://www.iis.net/',
              description: 'Microsoft-HTTPAPI/2.0 (IIS not configured)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{server: Microsoft-HTTPAPI/2.0}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              vendor: 'Microsoft',
              product: 'Internet Information Services',
              website: 'https://www.iis.net/',
              description: 'Microsoft IIS - Error Matches',
              tags: ['Web Server'],
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Error Code: 403 Forbidden. The server denied the specified Uniform Resource Locator \(URL\)/,
                },
                {
                  match_type: :content_body,
                  match_content: /HTTP Error 404. The requested resource is not found./,
                },
                {
                  match_type: :content_body,
                  match_content: /403 Forbidden. The server denied the specified Uniform Resource Locator (URL)/,
                },
                {
                  match_type: :content_body,
                  match_content: /HTTP Error 503. The service is unavailable./,
                }
              ],
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Microsoft',
              product: 'Kestrel',
              references: ['https://stackify.com/what-is-kestrel-web-server/'],
              description: 'kestrel in server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: Kestrel/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Productivity', 'SaaS', 'Login Panel'],
              vendor: 'Microsoft',
              product: 'Office 365',
              website: 'https://www.office.com/',
              description: 'Microsoft Office 365 - Login Panel Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-ms-server-fqdn/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /x-ms-ests-server:/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /x-ms-clitelem:/i,
                },
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Productivity', 'SaaS', 'Login Panel'],
              vendor: 'Microsoft',
              product: 'Office 365',
              website: 'https://www.office.com/',
              description: 'Microsoft Office 365 - Login Panel Cookies Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /x-ms-gateway-slice/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Productivity', 'SaaS'],
              vendor: 'Microsoft',
              product: 'Office 365',
              website: 'https://www.office.com/',
              description: 'Microsoft Office 365 - (Okta) Body Match',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{ok3static.oktacdn.com/assets/img/logos/office365}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },

            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Productivity', 'SaaS', 'Login Panel'],
              vendor: 'Microsoft',
              product: 'Office 365',
              website: 'https://www.office.com/',
              description: 'Microsoft Office 365 - Login Panel Head Match',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Sign in to your account/i,
                },
                {
                  match_type: :content_body,
                  match_content: /favicon_a_eupayfgghqiai7k9sol6lg2.ico/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'Mail Server', 'COTS'],
              vendor: 'Microsoft',
              product: 'Outlook Web Access',
              website: 'https://outlook.live.com/',
              description: 'Microsoft Outlook Web Access - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{location: /owa},
                },
                {
                  match_type: :conent_headers,
                  match_content: %r{^Location: https://.*/owa/$},
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'Mail Server', 'COTS'],
              vendor: 'Microsoft',
              product: 'Outlook Web Access',
              website: 'https://outlook.live.com/',
              description: 'Microsoft Outlook Web Access (header)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-owa-version/,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /x-owa-version:(.*)/)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'Mail Server', 'COTS', 'Login Panel'],
              vendor: 'Microsoft',
              product: 'Outlook Web Access',
              website: 'https://outlook.live.com/',
              description: 'Microsoft Outlook Web Access - Login panel page reference.',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /OwaPage\ =\ ASP.auth_logon_aspx/i
                },
                {
                  match_type: :content_body,
                  match_content: /logonContainer/i
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_body_capture x, %r{href="/owa/auth/(.*)/themes/resources/favicon.ico}
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'Mail Server', 'COTS'],
              vendor: 'Microsoft',
              product: 'Outlook Web Access',
              website: 'https://outlook.live.com/',
              description: 'title',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Outlook Web App$/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'CMS', 'Web Server'],
              vendor: 'Microsoft',
              product: 'Sharepoint Server',
              website: 'https://www.microsoft.com/en-gb/microsoft-365/sharepoint/collaboration',
              description: 'Inferred from services version',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /microsoftsharepointteamservices/,
                }
              ],
              dynamic_version: lambda { |x|
                                 sharepoint_server_version_from_team_services(_first_header_capture(x,
                                                                                                    /^microsoftsharepointteamservices:(.*)/i))[:version]
                               },
              dynamic_update: lambda { |x|
                                sharepoint_server_version_from_team_services(_first_header_capture(x,
                                                                                                   /^microsoftsharepointteamservices:(.*)/i))[:update]
                              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Productivity CMS],
              vendor: 'Microsoft',
              product: 'Sharepoint Foundation',
              website: 'https://www.microsoft.com/en-gb/microsoft-365/sharepoint/collaboration',
              description: 'error page',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Troubleshoot issues with Microsoft SharePoint Foundation. - Opens in new window/,
                }
              ],
              paths: [{ path: "#{url}/WebResource.asmx", follow_redirects: true }],
              require_product: 'ASP.NET',
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Productivity CMS],
              vendor: 'Microsoft',
              product: 'Sharepoint Team Services',
              website: 'https://www.microsoft.com/en-gb/microsoft-365/sharepoint/collaboration',
              description: 'Sharepoint cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /sprequestguid/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Productivity CMS],
              vendor: 'Microsoft',
              product: 'Sharepoint Team Services',
              website: 'https://www.microsoft.com/en-gb/microsoft-365/sharepoint/collaboration',
              description: 'Sharepoint cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^microsoftsharepointteamservices:.*$/,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /^microsoftsharepointteamservices:(.*)/i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Productivity CMS],
              vendor: 'Microsoft',
              product: 'Sharepoint Server',
              website: 'https://www.microsoft.com/en-gb/microsoft-365/sharepoint/collaboration',
              description: 'Sharepoint cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_generator,
                  match_content: /^Microsoft SharePoint$/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Productivity CMS],
              vendor: 'Microsoft',
              product: 'Sharepoint Services',
              website: 'https://www.microsoft.com/en-gb/microsoft-365/sharepoint/collaboration',
              description: 'header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /microsoftofficewebserver:.*/,
                }
              ],
              dynamic_version: ->(x) { _first_header_capture(x, /^microsoftofficewebserver:(.*)/i) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Productivity CMS],
              vendor: 'Microsoft',
              product: 'Sharepoint Services',
              website: 'https://www.microsoft.com/en-gb/microsoft-365/sharepoint/collaboration',
              description: 'header',
              version: '3.0',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /microsoftofficewebserver: 5.0_Pub/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end

        # https://buildnumbers.wordpress.com/sharepoint/
        # https://www.eukhost.com/blog/webhosting/difference-between-windows-sharepoint-services-and-sharepoint-servers/
        # https://sathiya.io/sharepoint-2016-build-numbers
        def sharepoint_server_version_from_team_services(sp_teamsvc_version)
          # adjust the version to fit our naming scheme
          # simpluy  remove one of the .0's
          sp_version = sp_teamsvc_version.gsub('0.0.', '0.')

          reference_versions = File.open("#{$ident_dir}/data/microsoft_sharepoint_versions.csv").read.split("\n")

          # do the comparison and simply return if we ahve it
          reference_versions.each do |line|
            # it's a csv
            ref = line.split(',')

            # grab the relevant fields
            sp_release = ref[0]
            build_version = ref[1]
            update_version = ref[2]

            # modify to fit our schema
            compare_version = build_version.gsub(/\.\d+$/, '')
            if compare_version == sp_version # # Got it
              # recturn since we matched
              return { version: sp_release, update: update_version }
            end
          end

          # okay we made it this far, so no exact match
          # handle cases where we don't have an exact match here
          if sp_teamsvc_version =~ /^10\.0\.0\.\d+/
            { version: '2003', update: nil }
          elsif sp_teamsvc_version =~ /^11\.0\.0\.\d+/
            { version: '2003', update: nil }
          elsif sp_teamsvc_version =~ /^12\.0\.0\.\d+/
            { version: '2007', update: nil }
          elsif sp_teamsvc_version =~ /^14\.0\.0\.\d+/
            { version: '2010', update: nil }
          elsif sp_teamsvc_version =~ /^15\.0\.0\.\d+/
            { version: '2013', update: nil }
          elsif sp_teamsvc_version =~ /^16\.0\.4\d+\.\d+/
            { version: '2016', update: nil }
          elsif sp_teamsvc_version =~ /^16\.0\.10\d+\.\d+/
            { version: '2019', update: nil }
          else
            { version: nil, update: nil }
          end
        end

        # https://en.wikipedia.org/wiki/Internet_Information_Services
        def iis_to_os_version(iis_version)
          if iis_version == '10.0.17763'
            out = { version: ' Windows Server 2019 or Windows 10 October Update' }
          elsif iis_version == '10.0'
            out = { version: ' Windows Server, version 1709 (Semi-Annual Channel) or Windows 10 Fall Creators Update' }
          elsif iis_version == '10.0.14393' # IIS 10.0 version 1607
            out = { version: 'Windows Server 2016 or Windows 10 Anniversary Update' }
          elsif iis_version == '8.5'
            out = { version: 'Windows Server 2012 R2 or Windows 8.1' }
          elsif iis_version == '8.0'
            out = { version: 'Windows Server 2012 or Windows 8' }
          elsif iis_version == '7.5'
            out = { version: 'Windows Server 2008 R2 or Windows 7' }
          elsif iis_version == '7.0'
            out = { version: 'Windows Server 2008 or Windows Vista' }
          elsif iis_version == '6.0'
            out = { version: 'Windows Server 2003 or Windows XP Professional x64 Edition' }
          elsif iis_version == '5.1'
            out = { version: 'Windows XP Professional' }
          elsif iis_version == '5.0'
            out = { version: 'Windows Server 2000' }
          elsif iis_version == '4.0'
            out = { version: 'Windows NT 4.0 Option Pack' }
          elsif iis_version == '3.0'
            out = { version: 'Windows NT 4.0 SP2' }
          elsif iis_version == '2.0'
            out = { version: 'Windows NT 4.0' }
          elsif iis_version == '1.0'
            out = { version: 'Windows NT 3.51' }
          end

          out
        end

        def owa_to_exchange_version(owa_version)
          # 2007 SP1
          if ['8.1.240.5', '8.1.240.6'].include?(owa_version)
            out = { version: '2007', update: 'SP1' }
          elsif owa_version == '8.1.263.1'
            out = { version: '2007', update: 'SP1 Update Rollup 1' }
          elsif owa_version == '8.1.278.2'
            out = { version: '2007', update: 'SP1 Update Rollup 2' }
          elsif owa_version == '8.1.291.2'
            out = { version: '2007', update: 'SP1 Update Rollup 3' }
          elsif ['8.1.311.2', '8.1.311.3'].include?(owa_version)
            out = { version: '2007', update: 'SP1 Update Rollup 4' }
          elsif owa_version == '8.1.336.1'
            out = { version: '2007', update: 'SP1 Update Rollup 5' }
          elsif ['8.1.340.0', '8.1.340.1'].include?(owa_version)
            out = { version: '2007', update: 'SP1 Update Rollup 6' }
          elsif owa_version == '8.1.359.2'
            out = { version: '2007', update: 'SP1 Update Rollup 7' }
          elsif owa_version == '8.1.375.2'
            out = { version: '2007', update: 'SP1 Update Rollup 8' }
          elsif owa_version == '8.1.393.1'
            out = { version: '2007', update: 'SP1 Update Rollup 9' }
          elsif owa_version == '8.1.436.0'
            out = { version: '2007', update: 'SP1 Update Rollup 10' }

          # 2007 SP2
          elsif owa_version == '8.2.176.2'
            out = { version: '2007', update: 'SP2' }
          elsif ['8.2.217.2', '8.2.217.3'].include?(owa_version)
            out = { version: '2007', update: 'SP2 Update Rollup 1' }
          elsif owa_version == '8.2.234.1'
            out = { version: '2007', update: 'SP2 Update Rollup 2' }
          elsif owa_version == '8.2.247.2'
            out = { version: '2007', update: 'SP2 Update Rollup 3' }
          elsif ['8.2.254.0', '8.2.254.1'].include?(owa_version)
            out = { version: '2007', update: 'SP2 Update Rollup 4' }
          elsif owa_version == '8.2.301.0'
            out = { version: '2007', update: 'SP2 Update Rollup 4',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '8.2.305.3'
            out = { version: '2007', update: 'SP2 Update Rollup 5' }

          # 2007 SP3
          elsif ['8.3.083.6', '8.3.83.4'].include?(owa_version)
            out = { version: '2007', update: 'SP3' }
          elsif owa_version == '8.3.106.2'
            out = { version: '2007', update: 'SP3 Update Rollup 1' }
          elsif owa_version == '8.3.137.3'
            out = { version: '2007', update: 'SP3 Update Rollup 2' }
          elsif owa_version == '8.3.159.0'
            out = { version: '2007', update: 'SP3 Update Rollup 3' }
          elsif owa_version == '8.3.159.2'
            out = { version: '2007', update: 'SP3 Update Rollup 3-v2' }
          elsif owa_version == '8.3.192.1'
            out = { version: '2007', update: 'SP3 Update Rollup 4' }
          elsif owa_version == '8.3.213.1'
            out = { version: '2007', update: 'SP3 Update Rollup 5' }
          elsif ['8.3.245.1', '8.3.245.2'].include?(owa_version)
            out = { version: '2007', update: 'SP3 Update Rollup 6' }
          elsif owa_version == '8.3.264.0'
            out = { version: '2007', update: 'SP3 Update Rollup 7' }
          elsif owa_version == '8.3.279.3'
            out = { version: '2007', update: 'SP3 Update Rollup 8' }
          elsif owa_version == '8.3.279.5'
            out = { version: '2007', update: 'SP3 Update Rollup 8-v2' }
          elsif owa_version == '8.3.279.6'
            out = { version: '2007', update: 'SP3 Update Rollup 8-v3' }
          elsif ['8.3.297.1', '8.3.297.2'].include?(owa_version) # .32
            out = { version: '2007', update: 'SP3 Update Rollup 9' }
          elsif ['8.3.298.1', '8.3.298.3'].include?(owa_version)
            out = { version: '2007', update: 'SP3 Update Rollup 10' }
          elsif owa_version == '8.3.327.1'
            out = { version: '2007', update: 'SP3 Update Rollup 11' }
          elsif owa_version == '8.3.342.4'
            out = { version: '2007', update: 'SP3 Update Rollup 12' }
          elsif ['8.3.348.1', '8.3.348.2'].include?(owa_version)
            out = { version: '2007', update: 'SP3 Update Rollup 13' }
          elsif owa_version == '8.3.379.2'
            out = { version: '2007', update: 'SP3 Update Rollup 14' }
          elsif owa_version == '8.3.389.2'
            out = { version: '2007', update: 'SP3 Update Rollup 15' }
          elsif owa_version == '8.3.406.0'
            out = { version: '2007', update: 'SP3 Update Rollup 16' }
          elsif owa_version == '8.3.415.0'
            out = { version: '2007', update: 'SP3 Update Rollup 16',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '8.3.417.1'
            out = { version: '2007', update: 'SP3 Update Rollup 17' }
          elsif owa_version == '8.3.444.0'
            out = { version: '2007', update: 'SP3 Update Rollup 17',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '8.3.445.0'
            out = { version: '2007', update: 'SP3 Update Rollup 18' }
          elsif owa_version == '8.3.459.0'
            out = { version: '2007', update: 'SP3 Update Rollup 19' }
          elsif owa_version == '8.3.465.0'
            out = { version: '2007', update: 'SP3 Update Rollup 19',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '8.3.468.0'
            out = { version: '2007', update: 'SP3 Update Rollup 20' }
          elsif owa_version == '8.3.485.1'
            out = { version: '2007', update: 'SP3 Update Rollup 21' }
          elsif owa_version == '8.3.499.0'
            out = { version: '2007', update: 'SP3 Update Rollup 21',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '8.3.502.0'
            out = { version: '2007', update: 'SP3 Update Rollup 22' }
          elsif owa_version == '8.3.516.0'
            out = { version: '2007', update: 'SP3 Update Rollup 22',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '8.3.517.0'
            out = { version: '2007', update: 'SP3 Update Rollup 23' }

            # 2010
          elsif owa_version == '14.0.639.21'
            out = { version: '2010', update: 'RTM' }
          elsif owa_version == '14.0.682.1'
            out = { version: '2010', update: 'Rollup 1' }
          elsif owa_version == '14.0.689.0'
            out = { version: '2010', update: 'Rollup 2' }
          elsif owa_version == '14.0.694.0'
            out = { version: '2010', update: 'Rollup 3' }
          elsif owa_version == '14.0.702.1'
            out = { version: '2010', update: 'Rollup 4' }
          elsif owa_version == '14.0.722.0' # unknown release, found in the wild
            out = { version: '2010', update: 'Rollup 4',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '14.0.726.0'
            out = { version: '2010', update: 'Rollup 5' }

          # 2010 SP1
          elsif ['14.1.218.13', '14.1.218.15'].include?(owa_version)
            out = { version: '2010', update: 'SP1' }
          elsif owa_version == '14.1.255.2'
            out = { version: '2010', update: 'SP1 Rollup 1' }
          elsif owa_version == '14.1.270.1'
            out = { version: '2010', update: 'SP1 Rollup 2' }
          elsif owa_version == '14.1.287.0'
            out = { version: '2010', update: 'SP1 Rollup 2',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '14.1.289.3'
            out = { version: '2010', update: 'SP1 Rollup 3' }
          elsif owa_version == '14.1.289.7'
            out = { version: '2010', update: 'SP1 Rollup 3-v3' }
          elsif owa_version == '14.1.323.1'
            out = { version: '2010', update: 'SP1 Rollup 4' }
          elsif owa_version == '14.1.323.6'
            out = { version: '2010', update: 'SP1 Rollup 4-v2' }
          elsif owa_version == '14.1.339.1'
            out = { version: '2010', update: 'SP1 Rollup 5' }
          elsif owa_version == '14.1.355.2'
            out = { version: '2010', update: 'SP1 Rollup 6' }
          elsif owa_version == '14.1.420.0'
            out = { version: '2010', update: 'SP1 Rollup 6',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '14.1.421.0'
            out = { version: '2010', update: 'SP1 Rollup 7' }
          elsif owa_version == '14.1.421.2'
            out = { version: '2010', update: 'SP1 Rollup 7-v2' }
          elsif owa_version == '14.1.421.3'
            out = { version: '2010', update: 'SP1 Rollup 7-v3' }
          elsif owa_version == '14.1.438.0'
            out = { version: '2010', update: 'SP1 Rollup 8' }

          # 2010 SP2
          elsif owa_version == '14.2.247.5'
            out = { version: '2010', update: 'SP2' }
          elsif owa_version == '14.2.283.3'
            out = { version: '2010', update: 'SP2 Rollup 1' }
          elsif owa_version == '14.2.298.4'
            out = { version: '2010', update: 'SP2 Rollup 2' }
          elsif owa_version == '14.2.309.2'
            out = { version: '2010', update: 'SP2 Rollup 3' }
          elsif owa_version == '14.2.318.2'
            out = { version: '2010', update: 'SP2 Rollup 4' }
          elsif owa_version == '14.2.318.4'
            out = { version: '2010', update: 'SP2 Rollup 4-v2' }
          elsif owa_version == '14.2.328.5'
            out = { version: '2010', update: 'SP2 Rollup 5' }
          elsif ['14.2.328.9', '14.2.328.10'].include?(owa_version)
            out = { version: '2010', update: 'SP2 Rollup 5-v2' }
          elsif owa_version == '14.2.342.3'
            out = { version: '2010', update: 'SP2 Rollup 6' }
          elsif owa_version == '14.2.347.0'
            out = { version: '2010', update: 'SP2 Rollup 6',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '14.2.375.0'
            out = { version: '2010', update: 'SP2 Rollup 7' }
          elsif owa_version == '14.2.390.1' # unknown release, found in the wild
            out = { version: '2010', update: 'SP2 Rollup 8',
                    note: "prerelease version: #{owa_version}" }
          elsif owa_version == '14.2.390.3'
            out = { version: '2010', update: 'SP2 Rollup 8' }

          # 2010 SP3
          elsif ['14.3.123.3', '14.3.123.3'].include?(owa_version)
            out = { version: '2010', update: 'SP3' }
          elsif owa_version == '14.3.146.0'
            out = { version: '2010', update: 'SP3 Rollup 1' }
          elsif owa_version == '14.3.158.1'
            out = { version: '2010', update: 'SP3 Rollup 2' }
          elsif owa_version == '14.3.169.1'
            out = { version: '2010', update: 'SP3 Rollup 3' }
          elsif owa_version == '14.3.174.1'
            out = { version: '2010', update: 'SP3 Rollup 4' }
          elsif owa_version == '14.3.181.6'
            out = { version: '2010', update: 'SP3 Rollup 5' }
          elsif owa_version == '14.3.195.1'
            out = { version: '2010', update: 'SP3 Rollup 6' }
          elsif owa_version == '14.3.210.2'
            out = { version: '2010', update: 'SP3 Rollup 7' }
          elsif owa_version == '14.3.224.2'
            out = { version: '2010', update: 'SP3 Rollup 8-v2' }
          elsif owa_version == '14.3.235.1'
            out = { version: '2010', update: 'SP3 Rollup 9' }
          elsif owa_version == '14.3.248.2'
            out = { version: '2010', update: 'SP3 Rollup 10' }
          elsif owa_version == '14.3.266.1'
            out = { version: '2010', update: 'SP3 Rollup 11' }
          elsif owa_version == '14.3.279.2'
            out = { version: '2010', update: 'SP3 Rollup 12' }
          elsif owa_version == '14.3.294.0'
            out = { version: '2010', update: 'SP3 Rollup 13' }
          elsif owa_version == '14.3.301.0'
            out = { version: '2010', update: 'SP3 Rollup 14' }
          elsif owa_version == '14.3.319.2'
            out = { version: '2010', update: 'SP3 Rollup 15' }
          elsif owa_version == '14.3.339.0'
            out = { version: '2010', update: 'SP3 Rollup 16' }
          elsif owa_version == '14.3.351.0'
            out = { version: '2010', update: 'SP3 Rollup 16',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '14.3.352.0'
            out = { version: '2010', update: 'SP3 Rollup 17' }
          elsif owa_version == '14.3.361.1'
            out = { version: '2010', update: 'SP3 Rollup 18' }
          elsif owa_version == '14.3.382.0'
            out = { version: '2010', update: 'SP3 Rollup 19' }
          elsif owa_version == '14.3.388.0' # found in the wild
            out = { version: '2010', update: 'SP3 Rollup 19',
                    note: "additional updates applied: #{owa_version}"  }
          elsif owa_version == '14.3.389.1'
            out = { version: '2010', update: 'SP3 Rollup 20' }
          elsif owa_version == '14.3.399.0'
            out = { version: '2010', update: 'SP3 Rollup 21',
                    note: "additional updates applied: #{owa_version}"  }
          elsif owa_version == '14.3.399.2'
            out = { version: '2010', update: 'SP3 Rollup 21' }
          elsif owa_version == '14.3.409.0'
            out = { version: '2010', update: 'SP3 Rollup 21',
                    note: "additional updates applied: #{owa_version}"  }
          elsif owa_version == '14.3.411.0'
            out = { version: '2010', update: 'SP3 Rollup 22' }
          elsif owa_version == '14.3.415.0'
            out = { version: '2010', update: 'SP3 Rollup 22',
                    note: "additional updates applied: #{owa_version}"  }
          elsif owa_version == '14.3.417.0'
            out = { version: '2010', update: 'SP3 Rollup 23' }
          elsif owa_version == '14.3.419.0'
            out = { version: '2010', update: 'SP3 Rollup 24' }
          elsif owa_version == '14.3.435.0'
            out = { version: '2010', update: 'SP3 Rollup 25' }
          elsif owa_version == '14.3.439.0' # unknown release, found in the wild
            out = { version: '2010', update: 'SP3 Rollup 25',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '14.3.442.0'
            out = { version: '2010', update: 'SP3 Rollup 26' }
          elsif owa_version == '14.3.452.0'
            out = { version: '2010', update: 'SP3 Rollup 27' }
          elsif owa_version == '14.3.461.1'
            out = { version: '2010', update: 'SP3 Rollup 28' }
          elsif owa_version == '14.3.468.0'
            out = { version: '2010', update: 'SP3 Rollup 29' }
          elsif owa_version == '14.3.487.0' # unknown release, found in the wild
            out = { version: '2010', update: 'SP3 Rollup 29',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '14.3.496.0'
            out = { version: '2010', update: 'SP3 Rollup 30' }
          elsif owa_version == '14.3.509.0'
            out = { version: '2010', update: 'SP3 Rollup 31' }
          elsif owa_version == '14.3.513.0'
            out = { version: '2010', update: 'SP3 Rollup 32' }
          # 2013
          elsif owa_version == '15.0.516'
            out = { version: '2013', update: 'RTM' }
          elsif owa_version == '15.0.620' # .29"
            out = { version: '2013', update: 'Cumulative Update 1' }
          elsif owa_version == '15.0.712' # .24"
            out = { version: '2013', update: 'Cumulative Update 2' }
          elsif owa_version == '15.0.775' # .38"
            out = { version: '2013', update: 'Cumulative Update 3' }
          elsif owa_version == '15.0.847'
            out = { version: '2013', update: 'Cumulative Update 4' }
          elsif owa_version == '15.0.913' # .22"
            out = { version: '2013', update: 'Cumulative Update 5' }
          elsif owa_version == '15.0.995' # .29"
            out = { version: '2013', update: 'Cumulative Update 6' }
          elsif owa_version == '15.0.1044' # .25"
            out = { version: '2013', update: 'Cumulative Update 7' }
          elsif owa_version == '15.0.1076' # .9"
            out = { version: '2013', update: 'Cumulative Update 8' }
          elsif owa_version == '15.0.1104' # .5"
            out = { version: '2013', update: 'Cumulative Update 9' }
          elsif owa_version == '15.0.1130' # .7"
            out = { version: '2013', update: 'Cumulative Update 10' }
          elsif owa_version == '15.0.1156' # .6"
            out = { version: '2013', update: 'Cumulative Update 11' }
          elsif owa_version == '15.0.1178' # .4"
            out = { version: '2013', update: 'Cumulative Update 12' }
          elsif owa_version == '15.0.1210' # .3"
            out = { version: '2013', update: 'Cumulative Update 13' }
          elsif owa_version == '15.0.1236' # .3"
            out = { version: '2013', update: 'Cumulative Update 14' }
          elsif owa_version == '15.0.1263' # .5"
            out = { version: '2013', update: 'Cumulative Update 15' }
          elsif owa_version == '15.0.1293' # .2"
            out = { version: '2013', update: 'Cumulative Update 16' }
          elsif owa_version == '15.0.1320' # .4"
            out = { version: '2013', update: 'Cumulative Update 17' }
          elsif owa_version == '15.0.1347' # .2"
            out = { version: '2013', update: 'Cumulative Update 18' }
          elsif owa_version == '15.0.1365' # .1"
            out = { version: '2013', update: 'Cumulative Update 19' }
          elsif owa_version == '15.0.1367' # .3"
            out = { version: '2013', update: 'Cumulative Update 20' }
          elsif owa_version == '15.0.1395' # .4"
            out = { version: '2013', update: 'Cumulative Update 21' }
          elsif ['15.0.1473.3', '15.0.1473'].include?(owa_version)
            out = { version: '2013', update: 'Cumulative Update 22' }
          elsif ['15.0.1497', '15.0.1497.2'].include?(owa_version)
            out = { version: '2013', update: 'Cumulative Update 23' }

          # 2016
          elsif owa_version == '15.1.225' # .16"
            out = { version: '2016', update: 'Preview' }
          elsif owa_version == '15.1.225' # .42"
            out = { version: '2016', update: 'RTM' }
          elsif owa_version == '15.1.396' # .30"
            out = { version: '2016', update: 'Cumulative Update 1' }
          elsif owa_version == '15.1.466' # .34"
            out = { version: '2016', update: 'Cumulative Update 2' }
          elsif ['15.1.466', '15.1.544'].include?(owa_version)
            out = { version: '2016', update: 'Cumulative Update 3' }
          elsif owa_version == '15.1.669'
            out = { version: '2016', update: 'Cumulative Update 4' }
          elsif owa_version == '15.1.845' # .34"
            out = { version: '2016', update: 'Cumulative Update 5' }
          elsif owa_version == '15.1.1034' # .26"
            out = { version: '2016', update: 'Cumulative Update 6' }
          elsif owa_version == '15.1.1261' # .35"
            out = { version: '2016', update: 'Cumulative Update 7' }
          elsif owa_version == '15.1.1415' # .2"
            out = { version: '2016', update: 'Cumulative Update 8' }
          elsif owa_version == '15.1.1466' # .3"
            out = { version: '2016', update: 'Cumulative Update 9' }
          elsif owa_version == '15.1.1531' # .3"
            out = { version: '2016', update: 'Cumulative Update 10' }
          elsif owa_version == '15.1.1591' # .01"
            out = { version: '2016', update: 'Cumulative Update 11' }
          elsif ['15.1.1713', '15.1.1713.5'].include?(owa_version) # .01"
            out = { version: '2016', update: 'Cumulative Update 12' }
          elsif ['15.1.1779', '15.1.1779.2'].include?(owa_version) # .01"
            out = { version: '2016', update: 'Cumulative Update 13' }
          elsif ['15.1.1847', '15.1.1847.3'].include?(owa_version) # .01"
            out = { version: '2016', update: 'Cumulative Update 14' }
          elsif owa_version == '15.1.1913'
            out = { version: '2016', update: 'Cumulative Update 15' }
          elsif owa_version == '15.1.1986'
            out = { version: '2016', update: 'Cumulative Update 15',
                    note: "additional updates applied: #{owa_version}" }
          elsif owa_version == '15.1.1979'
            out = { version: '2016', update: 'Cumulative Update 16' }
          elsif owa_version == '15.1.2044'
            out = { version: '2016', update: 'Cumulative Update 17' }
          elsif ['15.1.2106', '15.1.2106.2'].include?(owa_version)
            out = { version: '2016', update: 'Cumulative Update 18' }
          elsif ['15.1.2176', '15.1.2176.2'].include?(owa_version)
            out = { version: '2016', update: 'Cumulative Update 19' }
          elsif ['15.1.2242', '15.1.2242.4'].include?(owa_version)
            out = { version: '2016', update: 'Cumulative Update 20' }
          elsif ['15.1.2308', '15.1.2308.8', '15.1.2308.14'].include?(owa_version)
            out = { version: '2016', update: 'Cumulative Update 21' }

          # 2019
          # taken from https://docs.microsoft.com/en-us/Exchange/new-features/build-numbers-and-release-dates?redirectedfrom=MSDN&view=exchserver-2019
          elsif owa_version == '15.2.196.0' #
            out = { version: '2019', update: 'Preview' }
          elsif ['15.2.221', '15.2.221.12'].include?(owa_version)
            out = { version: '2019', update: 'RTM' }
          elsif ['15.2.330', '15.2.330.5'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 1' }
          elsif ['15.2.397', '15.2.397.3'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 2' }
          elsif ['15.2.464', '15.2.464.5'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 3' }
          elsif ['15.2.529', '15.2.529.5'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 4' }
          elsif ['15.2.595', '15.2.595.3'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 5' }
          elsif ['15.2.659', '15.2.659.4'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 6' }
          elsif ['15.2.721', '15.2.721.2'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 7' }
          elsif ['15.2.792', '15.2.792.3'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 8' }
          elsif ['15.2.858', '15.2.858.5'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 9' }
          elsif ['15.2.922', '15.2.922.7'].include?(owa_version)
            out = { version: '2019', update: 'Cumulative Update 10' }

          # office 365
          # https://www.msoutlook.info/question/277
          elsif owa_version == '15.20.*'
            out = { version: 'O365', update: 'Current' }

          # NOTE: "additional updates applied: #{owa_version}" }

          # 1694  Microsoft Exchange Server [Unknown 15.2.221] [Unknown 15.2.221], Exchange Server 2019 RTM
          # 2287  Microsoft Exchange Server [Unknown 15.2.397] [Unknown 15.2.397], Exchange Server 2019 CU2
          # 2464  Microsoft Exchange Server [Unknown 15.2.330] [Unknown 15.2.330], Exchange Server 2019 CU1
          # 2670  Microsoft Exchange Server [Unknown 15.1.544] [Unknown 15.1.544], Exchange Server 2016 CU3
          # 3609  Microsoft Exchange Server [Unknown 15.2.464] [Unknown 15.2.464], Exchange Server 2019 CU3
          # 14034  Microsoft Exchange Server [Unknown 15.1.1713] [Unknown 15.1.1713], Exchange Server 2016 CU12
          #

          else
            out = { version: "[Unknown #{owa_version}]", update: "[Unknown #{owa_version}]" }
          end
        end
      end
    end
  end
end
