module Intrigue
  module Ident
  module Check
  class Microsoft < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET Default Application",
          :match_details =>"unique string",
          :version => nil,
          :match_type => :content_title,
          :match_content =>  /Home Page - My ASP.NET Application/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /AspNetCore.Antiforgery/i,
          :match_details =>"ASP.Net Antiforgery cookie",
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :version => nil,
          :dynamic_version => lambda{|x| 
            _first_body_capture(x,/ASP.NET Version:\ ([\d\.]*)/i)},
          :match_type => :content_body,
          :match_content =>  /^.*ASP.NET is configured*$/i,
          :match_details =>"ASP.Net Error Message",
          :paths => ["#{url}", "#{url}/doesntexist-123" ], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :version => nil,
          :dynamic_version => lambda{ |x| 
            _first_header_capture(x,/^x-aspnet-version:\ ([\d\.]*)/i) },
          :match_type => :content_headers,
          :match_content =>  /^x-aspnet-version:.*$/i,
          :match_details =>"X-AspNet Header",
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :match_details =>"Asp.Net Cookie",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /ASPSESSIONID.*$/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :match_details =>"Asp.Net Default Cookie",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /ASP.NET_SessionId.*$/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :match_details =>"ASPXAUTH cookie",
          :version => nil,
          :references => [
            "https://www.sitefinity.com/developer-network/forums/developing-with-sitefinity-/claims-auth---aspxauth-cookie-remains"
          ],
          :match_type => :content_cookies,
          :match_content =>  /ASPXAUTH=/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET MVC",
          :match_details =>"ASP.Net MVC Header",
          :version => nil,
          :dynamic_version => lambda{ |x| 
            _first_header_capture(x,/^x-aspnetmvc-version:\s([\d\.]+)/i) },
          :match_type => :content_headers,
          :match_content =>  /x-aspnetmvc-version/i,
          :paths => ["#{url}"], 
          :inference => true
        },
        #{
        #  TODO. Not the same as MVC version
        #  :type => "fingerprint",
        #  :category => "application",
        #  :tags => ["Web Framework"],
        #  :vendor => "Microsoft",
        #  :product =>"ASP.NET Core",
        #  :match_details =>"Asp.Net MVC Header",
        #  :version => nil,
        #  :dynamic_version => lambda{ |x| 
        #    _first_header_capture(x,/^x-aspnetmvc-version:\s([\d\.]+)/i) },
        #  :match_type => :content_headers,
        #  :match_content => /x-aspnetmvc-version/i,
        #  :paths => ["#{url}"], 
        #  :inference => true
        #},
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :match_details => "WebResource.axd link in the page",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /WebResource.axd?d=/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :match_details =>"unique viewstate string",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /__VIEWSTATEGENERATOR/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :depends => [{:product => "ASP.NET"}],
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>".NET Framework",
          :match_details => "trace.axd version",
          :version => nil,
          :dynamic_version => lambda { |x| 
            _first_body_capture(x,/ASP.NET Version:([\d\.]*)/) 
          },
          :match_type => :content_body,
          :match_content =>  /Microsoft \.NET Framework Version/i,
          :paths => ["#{url}/Trace.axd"], 
          :require_product => "ASP.NET",
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting", "IaaS"],
          :vendor => "Microsoft",
          :product =>"Azure",
          :match_details => "standard 404",
          :version => nil,
          :match_type => :content_title,
          :match_content =>  /^Microsoft Azure Web App - Error 404$/i,
          :paths => ["#{url}"], 
          :hide => true,
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting", "Load Balancer", "IaaS"],
          :vendor => "Microsoft",
          :product =>"Azure",
          :match_details => "Proxy service header (x-msedge-ref)",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^x-msedge-ref:.*/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting", "Load Balancer", "IaaS"],
          :vendor => "Microsoft",
          :product =>"Azure",
          :match_details =>"Proxy header (x-ms-ref)",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^x-ms-ref:.*/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting", "Load Balancer", "IaaS"],
          :vendor => "Microsoft",
          :product =>"Azure",
          :match_details =>"Storage service header",
          :version => nil,
          :match_type => :content_headers,
          :match_content => /^x-ms-request-id:.*/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting", "Load Balancer", "IaaS"],
          :vendor => "Microsoft",
          :product =>"Azure",
          :match_details =>"cookie: ApplicationGatewayAffinity",
          :version => nil,
          :match_type => :content_cookies,
          :match_content => /ApplicationGatewayAffinity=/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Hosting", "Load Balancer", "IaaS"],
          :vendor => "Microsoft",
          :product =>"Azure",
          :match_details =>"cookie: ApplicationGatewayAffinityCORS",
          :version => nil,
          :match_type => :content_cookies,
          :match_content => /ApplicationGatewayAffinityCORS=/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["CDN", "IaaS"],
          :vendor => "Microsoft",
          :product => "Verizon Azure CDN",
          :references => [
            "https://docs.microsoft.com/en-us/azure/cdn/cdn-verizon-http-headers", 
            "https://docs.vdms.com/cdn/Content/HTTP_and_HTTPS_Data_Delivery/Response.htm"
          ],
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^server:\ (ECAcc|ECD|EOS|ECS)\ \([a-zA-Z]{3}\/[a-zA-Z0-9]{4}\)$/i,
          :dynamic_version => lambda { |x| 
            _first_header_capture(x,/^server:\ (ECAcc|ECD|EOS|ECS)\ \([a-zA-Z]{3}\/[a-zA-Z0-9]{4}\)$/i) },
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Microsoft",
          :product =>"ASP.NET",
          :match_details =>"powered by header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /x-powered-by: ASP.NET/,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["COTS"],
          :vendor => "Microsoft",
          :product =>"Commerce Server",
          :match_details =>"server header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /commerce-server-software: Microsoft Commerce Server.*/,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity","COTS", "Email"],
          :vendor => "Microsoft",
          :product =>"Exchange Server",
          :references => ["https://support.microsoft.com/en-us/help/4036163/you-can-t-access-owa-or-ecp-after-you-install-exchange-server-2016-cu6"],
          :match_details =>"x-feserver header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^x-feserver:.*$/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity","COTS", "Email"],
          :vendor => "Microsoft",
          :product =>"Exchange Server",
          :references => [],
          :match_details =>"/owa/ redirect",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^location:.*\/owa\/$/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "COTS"],
          :vendor => "Microsoft",
          :product =>"Exchange Server",
          :match_details =>"OWA Header -> Exchange server inference",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^x-owa-version:/i,
          :dynamic_version => lambda { |x|
            version_string = _first_header_capture(x, /^x-owa-version:(.*)$/i)
            owa_to_exchange_version(version_string)[:version]
          },
          :dynamic_update => lambda { |x|
            update_string = _first_header_capture(x, /^x-owa-version:(.*)$/i)
            owa_to_exchange_version(update_string)[:update]
          },
          :paths => ["#{url}"], 
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity","COTS", "Email"],
          :vendor => "Microsoft",
          :product =>"Exchange Server",
          :references => ["https://bit.ly/2k4Yoot"],
          :match_details =>"OWA version -> Exchange server inference (body)",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /OwaPage\ =\ ASP.auth_logon_aspx/i,
          :dynamic_version => lambda { |x|

            version_string = _first_body_capture(x, /href=\"\/owa\/auth\/([\d\.]+)\/themes\/resources\/favicon.ico/)
            version_string = _first_body_capture(x, /href=\"\/owa\/([\d\.]+)\/themes\/resources\/favicon.ico/) unless version_string

            owa_to_exchange_version(version_string)[:version]
          },
          :dynamic_update => lambda { |x|
            
            update_string = _first_body_capture(x, /href=\"\/owa\/auth\/([\d\.]+)\/themes\/resources\/favicon.ico/)
            update_string = _first_body_capture(x, /href=\"\/owa\/([\d\.]+)\/themes\/resources\/favicon.ico/) unless update_string
            
            owa_to_exchange_version(update_string)[:update]
          },
          :paths => ["#{url}"], 
          :inference => true # TODO - not specific enough yet
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity","COTS", "Email"],
          :vendor => "Microsoft",
          :product =>"Exchange Server",
          :references => ["https://bit.ly/2k4Yoot"],
          :match_details =>"OWA version -> Exchange server inference (headers)",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /x-owa-version/i,
          :dynamic_version => lambda { |x|

            version_string = _first_body_capture(x, /href=\"\/owa\/auth\/([\d\.]+)\/themes\/resources\/favicon.ico/)
            version_string = _first_body_capture(x, /href=\"\/owa\/([\d\.]+)\/themes\/resources\/favicon.ico/) unless version_string

            owa_to_exchange_version(version_string)[:version]
          },
          :dynamic_update => lambda { |x|
            
            update_string = _first_body_capture(x, /href=\"\/owa\/auth\/([\d\.]+)\/themes\/resources\/favicon.ico/)
            update_string = _first_body_capture(x, /href=\"\/owa\/([\d\.]+)\/themes\/resources\/favicon.ico/) unless update_string
            
            owa_to_exchange_version(update_string)[:update]
          },
          :paths => ["#{url}"], 
          :inference => true # TODO - not specific enough yet
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Firewall"],
          :vendor => "Microsoft",
          :product =>"Forefront TMG",
          :match_details =>"Microsoft Forefront Threat Management Gateway",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /<title>Microsoft Forefront TMG/,
          :paths => ["#{url}"], 
          :inference => false 
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Firewall"],
          :vendor => "Microsoft",
          :product =>"Forefront TMG",
          :match_details =>"Microsoft Forefront Threat Management Gateway",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /via:\ 1.1\ TMGSRVR/,
          :paths => ["#{url}"], 
          :inference => false 
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Firewall"],
          :vendor => "Microsoft",
          :product =>"ISA Server",
          :version => "2006",
          :match_type => :content_title,
          :match_content =>  /^Microsoft ISA Server 2006$/i,
          :match_details =>"standard title",
          :paths => ["#{url}"], 
          :inference => false 
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Library"],
          :vendor =>"Microsoft",
          :product =>"Frontpage",
          :match_details =>"server header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^.*FrontPage\/.*$/i,
          :dynamic_version => lambda { |x|
            _first_header_capture(x,/^.*FrontPage\/([\d\.]*).*$/i)
          },
          :paths => ["#{url}"], 
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor => "Microsoft",
          :product => "Internet Information Services",
          :match_details =>"server header",
          :version => nil,
          :dynamic_version => lambda { |x|
            _first_header_capture x, /server: Microsoft-IIS\/(.*)/
          },
          :match_type => :content_headers,
          :match_content =>  /server: Microsoft-IIS\//,
          :paths => ["#{url}"], 
          :inference => false # not specific enough
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor => "Microsoft",
          :product => "Internet Information Services",
          :match_details =>"body error messages",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /401.2 - Unauthorized: Access is denied due to server configuration.<br>Internet Information Services \(IIS\)/,
          :paths => ["#{url}"], 
          :inference => false # not specific enough
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor => "Microsoft",
          :product =>"Internet Information Services",
          :match_details =>"Internet Information Services",
          :version => "8.0",
          :match_type => :content_body,
          :match_content =>  /<img src=\"iis-8.png\"/,
          :paths => ["#{url}"], 
          :inference => false # not specific enough
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor => "Microsoft",
          :product =>"Internet Information Services",
          :match_details =>"Microsoft IIS 8.5",
          :version => "8.5",
          :match_type => :content_body,
          :match_content =>  /<img src=\"iis-85.png\"/,
          :paths => ["#{url}"], 
          :inference => false # not specific enough
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor => "Microsoft",
          :product =>"Internet Information Services",
          :match_details =>"Microsoft-HTTPAPI/2.0 (IIS not configured)",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /server: Microsoft-HTTPAPI\/2.0/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :vendor => "Microsoft",
          :product =>"Internet Information Services",
          :match_details =>"Microsoft IIS Unauthorized (403)",
          :tags => ["error_page"],
          :version => nil,
          :match_type => :content_body,
          :hide => true,
          :match_content =>  /Error Code: 403 Forbidden. The server denied the specified Uniform Resource Locator \(URL\)/,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor => "Microsoft",
          :product =>"Internet Information Services",
          :match_details =>"Microsoft IIS Missing Resource (404)",
          :version => nil,
          :match_type => :content_body,
          :hide => true,
          :match_content =>  /HTTP Error 404. The requested resource is not found./,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor => "Microsoft",
          :product =>"Internet Information Services",
          :match_details =>"Microsoft IIS Generic Error - 403",
          :version => nil,
          :match_type => :content_body,
          :hide => true,
          :match_content =>  /403 Forbidden. The server denied the specified Uniform Resource Locator (URL)/,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor => "Microsoft",
          :product =>"Internet Information Services",
          :match_details =>"Microsoft Generic Error - 503",
          :version => nil,
          :match_type => :content_body,
          :hide => true,
          :match_content =>  /HTTP Error 503. The service is unavailable./,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server"],
          :vendor =>"Microsoft",
          :product =>"Kestrel",
          :references => ["https://stackify.com/what-is-kestrel-web-server/"],
          :match_details =>"kestrel in server header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /server: Kestrel/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Productivity","SaaS"],
          :vendor =>"Microsoft",
          :product =>"Office 365",
          :match_details =>"office 365 api unique header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /x-ms-server-fqdn/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Productivity","SaaS"],
          :vendor =>"Microsoft",
          :product =>"Office 365 API",
          :match_details =>"office 365 api auth cookie",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /x-ms-gateway-slice/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Productivity","SaaS"],
          :vendor =>"Microsoft",
          :product =>"Office 365",
          :match_details =>"office 365 fronted by okta",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /ok3static.oktacdn.com\/assets\/img\/logos\/office365/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Productivity","SaaS"],
          :vendor =>"Microsoft",
          :product =>"Microsoft Outlook (Office 365)",
          :match_details =>"office 365 outlook signin",
          :version => nil,
          :match_type => :content_title,
          :match_content =>  /Sign in to Outlook/i,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "COTS"],
          :vendor => "Microsoft",
          :product =>"Outlook Web Access",
          :match_details =>"Microsoft Outlook Web Access (header)",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /x-owa-version/,
          :dynamic_version => lambda { |x| 
            _first_header_capture(x, /x-owa-version:(.*)/) },
          :paths => ["#{url}"], 
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "COTS"],
          :vendor => "Microsoft",
          :product =>"Outlook Web Access",
          :match_details =>"Microsoft Outlook Web Access (body)",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /OwaPage\ =\ ASP.auth_logon_aspx/,
          :dynamic_version => lambda { |x| 
            _first_body_capture x, /href=\"\/owa\/auth\/(.*)\/themes\/resources\/favicon.ico/ },
          :paths => ["#{url}"], 
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "COTS"],
          :vendor => "Microsoft",
          :product =>"Outlook Web Access",
          :match_details =>"title",
          :version => nil,
          :match_type => :content_title ,
          :match_content =>  /^Outlook Web App$/,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "CMS"],
          :vendor => "Microsoft",
          :product =>"Sharepoint Server",
          :match_details =>"Inferred from services version",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /microsoftsharepointteamservices/,
          :dynamic_version => lambda { |x| 
            sharepoint_server_version_from_team_services(_first_header_capture(x,/^microsoftsharepointteamservices:(.*)/i))[:version] },
          :dynamic_update => lambda { |x| 
            sharepoint_server_version_from_team_services(_first_header_capture(x,/^microsoftsharepointteamservices:(.*)/i))[:update] },
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "CMS"],
          :vendor => "Microsoft",
          :product =>"Sharepoint Foundation",
          :match_details =>"error page",
          :version => nil,
          :match_type => :content_body,
          :requires_product => "Sharepoint Server",
          :match_content =>  /Troubleshoot issues with Microsoft SharePoint Foundation. - Opens in new window/,
          :paths => ["#{url}/WebResource.asmx"],
          :require_product => "ASP.NET",
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "CMS"],
          :vendor => "Microsoft",
          :product =>"Sharepoint Team Services",
          :match_details =>"Sharepoint cookie",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /sprequestguid/,
          :dynamic_version => lambda { |x| 
            _first_header_capture(x,/^microsoftsharepointteamservices:(.*)/i) },
          :paths => ["#{url}"], 
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "CMS"],
          :vendor => "Microsoft",
          :product =>"Sharepoint Team Services",
          :match_details =>"Sharepoint cookie",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^microsoftsharepointteamservices:.*$/,
          :dynamic_version => lambda { |x| 
            _first_header_capture(x,/^microsoftsharepointteamservices:(.*)/i) },
          :paths => ["#{url}"], 
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "CMS"],
          :vendor => "Microsoft",
          :product =>"Sharepoint Server",
          :match_details =>"Sharepoint cookie",
          :version => nil,
          :match_type => :content_generator,
          :match_content =>  /^Microsoft SharePoint$/,
          :paths => ["#{url}"], 
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "CMS"],
          :vendor => "Microsoft",
          :product =>"Sharepoint Services",
          :match_details =>"header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /microsoftofficewebserver:.*/,
          :dynamic_version => lambda { |x| _first_header_capture(x,/^microsoftofficewebserver:(.*)/i) },
          :paths => ["#{url}"], 
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Productivity", "CMS"],
          :vendor => "Microsoft",
          :product =>"Sharepoint Services",
          :match_details =>"header",
          :version => "3.0",
          :match_type => :content_headers,
          :match_content =>  /microsoftofficewebserver: 5.0_Pub/,
          :paths => ["#{url}"]
        }        
      ]
    end
  
    # https://buildnumbers.wordpress.com/sharepoint/
    # https://www.eukhost.com/blog/webhosting/difference-between-windows-sharepoint-services-and-sharepoint-servers/
    # https://sathiya.io/sharepoint-2016-build-numbers
    def sharepoint_server_version_from_team_services(sp_teamsvc_version)

      # adjust the version to fit our naming scheme
      # simpluy  remove one of the .0's
      sp_version = sp_teamsvc_version.gsub("0.0.","0.") 

      reference_versions = File.open("#{$ident_dir}/data/microsoft_sharepoint_versions.csv").read.split("\n")

      # do the comparison and simply return if we ahve it 
      reference_versions.each do |line|
        # it's a csv 
        ref = line.split(",")

        # grab the relevant fields
        sp_release = ref[0]
        build_version = ref[1]
        update_version = ref[2]
        
        # modify to fit our schema
        compare_version = build_version.gsub(/\.\d+$/,"")
        if compare_version == sp_version # # Got it 
          # recturn since we matched
          return { version: sp_release, update: update_version }
        end
      end      

      # okay we made it this far, so no exact match
      # handle cases where we don't have an exact match here     
      case 
      when sp_teamsvc_version =~ /^10\.0\.0\.\d+/
        out = { version: "2003", update: nil }
      when sp_teamsvc_version =~ /^11\.0\.0\.\d+/
        out = { version: "2003", update: nil }
      when sp_teamsvc_version =~ /^12\.0\.0\.\d+/
        out = { version: "2007", update: nil }
      when sp_teamsvc_version =~ /^14\.0\.0\.\d+/
        out = { version: "2010", update: nil }
      when sp_teamsvc_version =~ /^15\.0\.0\.\d+/
        out = { version: "2013", update: nil }
      when sp_teamsvc_version =~ /^16\.0\.4\d+\.\d+/
        out = { version: "2016", update: nil }
      when sp_teamsvc_version =~ /^16\.0\.10\d+\.\d+/
        out = { version: "2019", update: nil }
      else 
        out = { version: nil, update: nil }
      end
  
      
    out 
    end
  
    
    # https://en.wikipedia.org/wiki/Internet_Information_Services
    def iis_to_os_version(iis_version)
     
      case 
      when iis_version == "10.0.17763"
        out = { version: " Windows Server 2019 or Windows 10 October Update" }
      when iis_version == "10.0"
        out = { version: " Windows Server, version 1709 (Semi-Annual Channel) or Windows 10 Fall Creators Update" }          
      when iis_version == "10.0.14393" # IIS 10.0 version 1607
        out = { version: "Windows Server 2016 or Windows 10 Anniversary Update" }
      when iis_version == "8.5"
        out = { version: "Windows Server 2012 R2 or Windows 8.1" }
      when iis_version == "8.0"
        out = { version: "Windows Server 2012 or Windows 8" }
      when iis_version == "7.5"
        out = { version: "Windows Server 2008 R2 or Windows 7" }
      when iis_version == "7.0"
        out = { version: "Windows Server 2008 or Windows Vista" }
      when iis_version == "6.0"
        out = { version: "Windows Server 2003 or Windows XP Professional x64 Edition" }
      when iis_version == "5.1"
        out = { version: "Windows XP Professional" }
      when iis_version == "5.0"
        out = { version: "Windows Server 2000" }
      when iis_version == "4.0"
        out = { version: "Windows NT 4.0 Option Pack" }
      when iis_version == "3.0"
        out = { version: "Windows NT 4.0 SP2" }
      when iis_version == "2.0"
        out = { version: "Windows NT 4.0" }
      when iis_version == "1.0"
        out = { version: "Windows NT 3.51" }
      end

    out
    end
  
    def owa_to_exchange_version(owa_version)

      # 2007 SP1
      if owa_version == "8.1.240.6" #.32"
        out = { version: "2007 SP1", update: "RTM" }
      elsif owa_version == "8.1.263.1" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 1" }  
      elsif owa_version == "8.1.278.2" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 2" }  
      elsif owa_version == "8.1.291.2" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 3" }  
      elsif owa_version == "8.1.311.3" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 4" }  
      elsif owa_version == "8.1.336.1" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 5" }  
      elsif owa_version == "8.1.340.1" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 6" }  
      elsif owa_version == "8.1.359.2" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 7" }  
      elsif owa_version == "8.1.375.2" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 8" }  
      elsif owa_version == "8.1.393.1" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 9" }  
      elsif owa_version == "8.1.436.0" #.32"
        out = { version: "2007 SP1", update: "Update Rollup 10" }  
      
      # 2007 SP2 
      elsif owa_version == "8.2.176.2" #.32"
        out = { version: "2007 SP2", update: "RTM" }  
      elsif owa_version == "8.2.217.3" #.32"
        out = { version: "2007 SP2", update: "Update Rollup 1" }  
      elsif owa_version == "8.2.234.1" #.32"
        out = { version: "2007 SP2", update: "Update Rollup 2" }  
      elsif owa_version == "8.2.247.2" #.32"
        out = { version: "2007 SP2", update: "Update Rollup 3" }  
      elsif owa_version == "8.2.254.0" #.32"
        out = { version: "2007 SP2", update: "Update Rollup 4" }  
      elsif owa_version == "8.2.305.3" #.32"
        out = { version: "2007 SP2", update: "Update Rollup 5" }  
      
       # 2007 SP3 
      elsif owa_version == "8.3.083.6" #.32"
        out = { version: "2007 SP3", update: "RTM" }  
      elsif owa_version == "8.3.106.2" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 1" }  
      elsif owa_version == "8.3.137.3" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 2" }  
      elsif owa_version == "8.3.159.0" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 3" }  
      elsif owa_version == "8.3.159.2" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 3-v2" }  
      elsif owa_version == "8.3.192.1" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 4" }          
      elsif owa_version == "8.3.213.1" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 5" }  
      elsif owa_version == "8.3.245.2" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 6" }  
      elsif owa_version == "8.3.264.0" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 7" }  
      elsif owa_version == "8.3.279.3" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 8" }  
      elsif owa_version == "8.3.279.5" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 8-v2" }  
      elsif owa_version == "8.3.279.6" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 8-v3" }  
      elsif owa_version == "8.3.297.2" #.32
        out = { version: "2007 SP3", update: "Update Rollup 9" }  
      elsif owa_version == "8.3.298.3" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 10" }  
      elsif owa_version == "8.3.327.1" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 11" }  
      elsif owa_version == "8.3.342.4" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 12" }  
      elsif owa_version == "8.3.348.1" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 13" }  
      elsif owa_version == "8.3.379.2" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 14" }  
      elsif owa_version == "8.3.389.2" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 15" }  
      elsif owa_version == "8.3.406.0" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 16" }  
      elsif owa_version == "8.3.417.1" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 17" }  
      elsif owa_version == "8.3.445.0" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 18" }  
      elsif owa_version == "8.3.459.0" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 19" }  
      elsif owa_version == "8.3.468.0" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 20" }  
      elsif owa_version == "8.4.485.1" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 21" }  
      elsif owa_version == "8.3.502.0" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 22" }  
      elsif owa_version == "8.3.517.0" #.32"
        out = { version: "2007 SP3", update: "Update Rollup 23" }  

      # 2010
      elsif owa_version == "14.0.639.21"
        out = { version: "2010", update: "RTM" }  
      elsif owa_version == "14.0.682.1"
        out = { version: "2010", update: "Update Rollup 1" }  
      elsif owa_version == "14.0.689.0"
        out = { version: "2010", update: "Update Rollup 2" }  
      elsif owa_version == "14.0.694.0"
        out = { version: "2010", update: "Update Rollup 3" }          
      elsif owa_version == "14.0.702.1"
        out = { version: "2010", update: "Update Rollup 4" }  
      elsif owa_version == "14.0.722.0" # unknown release, found in the wild
        out = { version: "2010", update: "Update Rollup 4", 
          note: "additional updates applied: #{owa_version}" }  
      elsif owa_version == "14.0.726.0"
        out = { version: "2010", update: "Update Rollup 5" }  
      
      # 2010 SP1
      elsif owa_version == "14.1.218.13" || owa_version == "14.1.218.15"
        out = { version: "2010 SP1", update: "RTM" }  
      elsif owa_version == "14.1.255.2"
        out = { version: "2010 SP1", update: "Update Rollup 1" }  
      elsif owa_version == "14.1.270.1"
        out = { version: "2010 SP1", update: "Update Rollup 2" }  
      elsif owa_version == "14.1.287.0"
        out = { version: "2010 SP1", update: "Update Rollup 2", 
          note: "additional updates applied: #{owa_version}" }  
      elsif owa_version == "14.1.289.3"
        out = { version: "2010 SP1", update: "Update Rollup 3" }  
      elsif owa_version == "14.1.289.7"
        out = { version: "2010 SP1", update: "Update Rollup 3-v3" }  
      elsif owa_version == "14.1.323.1"
        out = { version: "2010 SP1", update: "Update Rollup 4" }  
      elsif owa_version == "14.1.323.6"
        out = { version: "2010 SP1", update: "Update Rollup 4-v2" }  
      elsif owa_version == "14.1.339.1"
        out = { version: "2010 SP1", update: "Update Rollup 5" }  
      elsif owa_version == "14.1.355.2"
        out = { version: "2010 SP1", update: "Update Rollup 6" }  
      elsif owa_version == "14.1.420.0"
        out = { version: "2010 SP1", update: "Update Rollup 6", 
          note: "additional updates applied: #{owa_version}"  }  
      elsif owa_version == "14.1.421.0"
        out = { version: "2010 SP1", update: "Update Rollup 7" }  
      elsif owa_version == "14.1.421.2"
        out = { version: "2010 SP1", update: "Update Rollup 7-v2" }  
      elsif owa_version == "14.1.421.3"
        out = { version: "2010 SP1", update: "Update Rollup 7-v3" }  
      elsif owa_version == "14.1.438.0"
        out = { version: "2010 SP1", update: "Update Rollup 8" }  

      # 2010 SP2 
      elsif owa_version == "14.2.247.5"
        out = { version: "2010 SP2", update: "RTM" }  
      elsif owa_version == "14.2.283.3"
        out = { version: "2010 SP2", update: "Update Rollup 1" }  
      elsif owa_version == "14.2.298.4"
        out = { version: "2010 SP2", update: "Update Rollup 2" }  
      elsif owa_version == "14.2.309.2"
        out = { version: "2010 SP2", update: "Update Rollup 3" }  
      elsif owa_version == "14.2.318.2"
        out = { version: "2010 SP2", update: "Update Rollup 4" }  
      elsif owa_version == "14.2.318.4"
        out = { version: "2010 SP2", update: "Update Rollup 4-v2" }  
      elsif owa_version == "14.2.328.5"
        out = { version: "2010 SP2", update: "Update Rollup 5" }  
      elsif owa_version == "14.2.328.9" || owa_version == "14.2.328.10"
        out = { version: "2010 SP2", update: "Update Rollup 5-v2" }  
      elsif owa_version == "14.2.342.3"
        out = { version: "2010 SP2", update: "Update Rollup 6" }  
      elsif owa_version == "14.2.347.0"
        out = { version: "2010 SP2", update: "Update Rollup 6",
          note: "additional updates applied: #{owa_version}" }  
      elsif owa_version == "14.2.375.0"
        out = { version: "2010 SP2", update: "Update Rollup 7" }  
      elsif owa_version == "14.2.390.1" # unknown release, found in the wild
        out = { version: "2010 SP2", update: "Update Rollup 8", 
          note: "prerelease version: #{owa_version}"  }  
      elsif owa_version == "14.2.390.3"
        out = { version: "2010 SP2", update: "Update Rollup 8" }  

      # 2010 SP3
      elsif owa_version == "14.3.123.3" || owa_version == "14.3.123.3"
        out = { version: "2010 SP3", update: "RTM" }  
      elsif owa_version == "14.3.146.0"
        out = { version: "2010 SP3", update: "Update Rollup 1" }  
      elsif owa_version == "14.3.158.1"
        out = { version: "2010 SP3", update: "Update Rollup 2" }  
      elsif owa_version == "14.3.169.1"
        out = { version: "2010 SP3", update: "Update Rollup 3" }  
      elsif owa_version == "14.3.174.1"
        out = { version: "2010 SP3", update: "Update Rollup 4" }  
      elsif owa_version == "14.3.181.6"
        out = { version: "2010 SP3", update: "Update Rollup 5" }  
      elsif owa_version == "14.3.195.1"
        out = { version: "2010 SP3", update: "Update Rollup 6" }  
      elsif owa_version == "14.3.210.2"
        out = { version: "2010 SP3", update: "Update Rollup 7" }  
      elsif owa_version == "14.3.224.2"
        out = { version: "2010 SP3", update: "Update Rollup 8-v2" }  
      elsif owa_version == "14.3.235.1"
        out = { version: "2010 SP3", update: "Update Rollup 9" }  
      elsif owa_version == "14.3.248.2"
        out = { version: "2010 SP3", update: "Update Rollup 10" }  
      elsif owa_version == "14.3.266.1"
        out = { version: "2010 SP3", update: "Update Rollup 11" }  
      elsif owa_version == "14.3.279.2"
        out = { version: "2010 SP3", update: "Update Rollup 12" }  
      elsif owa_version == "14.3.294.0"
        out = { version: "2010 SP3", update: "Update Rollup 13" }  
      elsif owa_version == "14.3.301.0"
        out = { version: "2010 SP3", update: "Update Rollup 14" }  
      elsif owa_version == "14.3.319.2"
        out = { version: "2010 SP3", update: "Update Rollup 15" }  
      elsif owa_version == "14.3.339.0"
        out = { version: "2010 SP3", update: "Update Rollup 16" }  
      elsif owa_version == "14.3.351.0"
        out = { version: "2010 SP3", update: "Update Rollup 16", 
          note: "additional updates applied: #{owa_version}" }  
      elsif owa_version == "14.3.352.0"
        out = { version: "2010 SP3", update: "Update Rollup 17" }  
      elsif owa_version == "14.3.361.1"
        out = { version: "2010 SP3", update: "Update Rollup 18" }  
      elsif owa_version == "14.3.382.0"
        out = { version: "2010 SP3", update: "Update Rollup 19" }  
      elsif owa_version == "14.3.388.0" # found in the wild
        out = { version: "2010 SP3", update: "Update Rollup 19", 
          note: "additional updates applied: #{owa_version}"  }  
      elsif owa_version == "14.3.389.1"
        out = { version: "2010 SP3", update: "Update Rollup 20" }  
      elsif owa_version == "14.3.399.0" 
        out = { version: "2010 SP3", update: "Update Rollup 21", 
          note: "additional updates applied: #{owa_version}"  }  
      elsif owa_version == "14.3.399.2"
        out = { version: "2010 SP3", update: "Update Rollup 21" }  
      elsif owa_version == "14.3.409.0"
        out = { version: "2010 SP3", update: "Update Rollup 21", 
          note: "additional updates applied: #{owa_version}"  }  
      elsif owa_version == "14.3.411.0"
        out = { version: "2010 SP3", update: "Update Rollup 22" }  
      elsif owa_version == "14.3.415.0"
        out = { version: "2010 SP3", update: "Update Rollup 22", 
          note: "additional updates applied: #{owa_version}"  }
      elsif owa_version == "14.3.417.0"
        out = { version: "2010 SP3", update: "Update Rollup 23" }  
      elsif owa_version == "14.3.419.0"
        out = { version: "2010 SP3", update: "Update Rollup 24" }  
      elsif owa_version == "14.3.435.0"
        out = { version: "2010 SP3", update: "Update Rollup 25" }  
      elsif owa_version == "14.3.439.0" # unknown release, found in the wild
        out = { version: "2010 SP3", update: "Update Rollup 25", 
          note: "additional updates applied: #{owa_version}" }  
      elsif owa_version == "14.3.442.0"
        out = { version: "2010 SP3", update: "Update Rollup 26" }  
      elsif owa_version == "14.3.452.0"
        out = { version: "2010 SP3", update: "Update Rollup 27" }  
      elsif owa_version == "14.3.461.1"
        out = { version: "2010 SP3", update: "Update Rollup 28" }  
      elsif owa_version == "14.3.468.0"
        out = { version: "2010 SP3", update: "Update Rollup 29" }  
      elsif owa_version == "14.3.487.0" # unknown release, found in the wild
        out = { version: "2010 SP3", update: "Update Rollup 29",
           note: "additional updates applied: #{owa_version}" }  
      elsif owa_version == "14.3.496.0"
        out = { version: "2010 SP3", update: "Update Rollup 30" }      
        
      # 2013
      elsif owa_version == "15.0.516" #.32"
          out = { version: "2013", update: "RTM" }  
      elsif owa_version == "15.0.620" #.29"
        out = { version: "2013", update: "Cumulative Update 1" }
      elsif owa_version == "15.0.712" #.24"
        out = { version: "2013", update: "Cumulative Update 2" }
      elsif owa_version == "15.0.775" #.38"
        out = { version: "2013", update: "Cumulative Update 3" }
      elsif owa_version == "15.0.847" #.32"
        out = { version: "2013", update: "Cumulative Update 4" }
      elsif owa_version == "15.0.913" #.22"
        out = { version: "2013", update: "Cumulative Update 5" }
      elsif owa_version == "15.0.995" #.29"
        out = { version: "2013", update: "Cumulative Update 6" }
      elsif owa_version == "15.0.1044" #.25"
        out = { version: "2013", update: "Cumulative Update 7" }
      elsif owa_version == "15.0.1076" #.9"
        out = { version: "2013", update: "Cumulative Update 8" }
      elsif owa_version == "15.0.1104" #.5"
        out = { version: "2013", update: "Cumulative Update 9" }
      elsif owa_version == "15.0.1130" #.7"
        out = { version: "2013", update: "Cumulative Update 10" }
      elsif owa_version == "15.0.1156" #.6"
        out = { version: "2013", update: "Cumulative Update 11" }
      elsif owa_version == "15.0.1178" #.4"
        out = { version: "2013", update: "Cumulative Update 12" }
      elsif owa_version == "15.0.1210" #.3"
        out = { version: "2013", update: "Cumulative Update 13" }
      elsif owa_version == "15.0.1236" #.3"
        out = { version: "2013", update: "Cumulative Update 14" }
      elsif owa_version == "15.0.1263" #.5"
        out = { version: "2013", update: "Cumulative Update 15" }
      elsif owa_version == "15.0.1293" #.2"
        out = { version: "2013", update: "Cumulative Update 16" }
      elsif owa_version == "15.0.1320" #.4"
        out = { version: "2013", update: "Cumulative Update 17" }
      elsif owa_version == "15.0.1347" #.2"
        out = { version: "2013", update: "Cumulative Update 18" }
      elsif owa_version == "15.0.1365" #.1"
        out = { version: "2013", update: "Cumulative Update 19" }
      elsif owa_version == "15.0.1367" #.3"
        out = { version: "2013", update: "Cumulative Update 20" }
      elsif owa_version == "15.0.1395" #.4"
        out = { version: "2013", update: "Cumulative Update 21" }
      elsif owa_version == "15.0.1473.3" || owa_version == "15.0.1473"  
        out = { version: "2013", update: "Cumulative Update 22" }
      elsif owa_version == "15.0.1497" 
        out = { version: "2013", update: "Cumulative Update 23" }
      elsif owa_version == "15.0.1497.2" 
        out = { version: "2013", update: "Cumulative Update 23" }
        
      # 2016
      elsif owa_version == "15.1.225" #.16"
        out = { version: "2016", update: "Preview" }
      elsif owa_version == "15.1.225" #.42"
        out = { version: "2016", update: "RTM" }
      elsif owa_version == "15.1.396" #.30"
        out = { version: "2016", update: "Cumulative Update 1" }
      elsif owa_version == "15.1.466" #.34"
        out = { version: "2016", update: "Cumulative Update 2" }
      elsif owa_version == "15.1.466" || owa_version == "15.1.544"
        out = { version: "2016", update: "Cumulative Update 3" }
      elsif owa_version == "15.1.669" #.32"
        out = { version: "2016", update: "Cumulative Update 4" }
      elsif owa_version == "15.1.845" #.34"
        out = { version: "2016", update: "Cumulative Update 5" }
      elsif owa_version == "15.1.1034" #.26"
        out = { version: "2016", update: "Cumulative Update 6" }
      elsif owa_version == "15.1.1261" #.35"
        out = { version: "2016", update: "Cumulative Update 7" }
      elsif owa_version == "15.1.1415" #.2"
        out = { version: "2016", update: "Cumulative Update 8" }
      elsif owa_version == "15.1.1466" #.3"
        out = { version: "2016", update: "Cumulative Update 9" }
      elsif owa_version == "15.1.1531" #.3"
        out = { version: "2016", update: "Cumulative Update 10" }
      elsif owa_version == "15.1.1591" #.01"
        out = { version: "2016", update: "Cumulative Update 11" }
      elsif owa_version == "15.1.1713" || owa_version == "15.1.1713.5" #.01"
        out = { version: "2016", update: "Cumulative Update 12" }
      elsif owa_version == "15.1.1779" || owa_version == "15.1.1779.2" #.01"
        out = { version: "2016", update: "Cumulative Update 13" }
      elsif owa_version == "15.1.1847" || owa_version == "15.1.1847.3" #.01"
        out = { version: "2016", update: "Cumulative Update 14" }
      elsif owa_version == "15.1.1913" #.01"
        out = { version: "2016", update: "Cumulative Update 15" }
      elsif owa_version == "15.1.1986" #.01"
        out = { version: "2016", update: "Cumulative Update 15",
          note: "additional updates applied: #{owa_version}" }


      # 2019
      elsif owa_version == "15.2.196.0" #
        out = { version: "2019", update: "Preview" }
      elsif owa_version == "15.2.221" || owa_version == "15.2.221.12" #
        out = { version: "2019", update: "RTM" }
      elsif owa_version == "15.2.330" || owa_version == "15.2.330.6" #
        out = { version: "2019", update: "Cumulative Update 1" }
      elsif owa_version == "15.2.397" || owa_version == "15.2.397.3" #
        out = { version: "2019", update: "Cumulative Update 2" }
      elsif owa_version == "15.2.464" ||  owa_version == "15.2.529" #
        out = { version: "2019", update: "Cumulative Update 3", 
          note: "additional updates applied: #{owa_version}" }
        
=begin 
1694  Microsoft Exchange Server [Unknown 15.2.221] [Unknown 15.2.221], Exchange Server 2019 RTM	
2287  Microsoft Exchange Server [Unknown 15.2.397] [Unknown 15.2.397], Exchange Server 2019 CU2	
2464  Microsoft Exchange Server [Unknown 15.2.330] [Unknown 15.2.330], Exchange Server 2019 CU1	
2670  Microsoft Exchange Server [Unknown 15.1.544] [Unknown 15.1.544], Exchange Server 2016 CU3	
3609  Microsoft Exchange Server [Unknown 15.2.464] [Unknown 15.2.464], Exchange Server 2019 CU3	
14034  Microsoft Exchange Server [Unknown 15.1.1713] [Unknown 15.1.1713], Exchange Server 2016 CU12	

=end 
          
      else
        out = { version: "[Unknown #{owa_version}]", update: "[Unknown #{owa_version}]" }
      end

      
      
    end
  
  
  
    
  end
  end
  end
  end
  
