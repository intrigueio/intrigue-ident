module Intrigue
module Ident
module Check
class Sap < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor =>"SAP",
        :product =>"Advanced Business Application Programming",
        :match_details =>"server header",
        :references => [
          "https://en.wikipedia.org/wiki/ABAP"
        ],
        :match_type => :content_headers,
        :match_content =>  /server: SAP NetWeaver Application Server [\d\.\s]*\/ ABAP [\d]+/i,
        :dynamic_version => lambda { |x| _first_header_capture(x, /server: SAP NetWeaver Application Server [\d\.\s]*\/ ABAP ([\d]+)/i,) },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor =>"SAP",
        :product =>"Internet Communication Manager",
        :match_details =>"server header",
        :references => [
          "https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/48/039d48c0070c84e10000000a42189c/frameset.htm"
        ],
        :match_type => :content_headers,
        :match_content =>  /server: SAP NetWeaver Application Server [\d\.\s]*\/ ICM [\d\.]+/i,
        :dynamic_version => lambda { |x| _first_header_capture(x, /server: SAP NetWeaver Application Server [\d\.\s]*\/ ICM ([\d\.]+)/i,) },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      },
      { ### TODO... can we get a version out of this?
        :type => "fingerprint",
        :require_product => "NetWeaver",
        :category => "application",
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"netweaver title in irj/portal",
        :version => nil,
        :references => ["https://apps.support.sap.com/sap/support/knowledge/en/1749574"],
        :match_type => :content_title,
        :match_content => /SAP&#x20;NetWeaver&#x20;Portal/i,
        :paths => [{ :path => "#{url}/irj/portal", :follow_redirects => true } ],
        :inference => false
      },
      { ### TODO... can we get a version out of this?
        :type => "fingerprint",
        :require_product => "NetWeaver",
        :category => "application",
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"netweaver version in irj/portal",
        :version => nil,
        :references => [""],
        :match_type => :content_title,
        :match_content => /SAP NetWeaver Application Server/i,
        # SAP NetWeaver Application Server 7.53
        :dynamic_version => lambda { |x| _first_header_capture(x, /SAP NetWeaver Application Server ([\d\.]+)/i,) },
        :paths => [{ :path => "#{url}/irj/portal", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"saplb cookie",
        :version => nil,
        :references => ["https://apps.support.sap.com/sap/support/knowledge/en/1749574"],
        :match_type => :content_cookies,
        :match_content => /saplb_\*=/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"portalalias cookie",
        :version => nil,
        :references => [],
        :match_type => :content_cookies,
        :match_content => /PortalAlias=/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"com.sap.engine.security.authentication.original_application_url cookie",
        :version => nil,
        :references => [],
        :match_type => :content_cookies,
        :match_content => /com.sap.engine.security.authentication.original_application_url=/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :require_product => "NetWeaver",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"LM Configuration Wizard detection",
        :version => nil,
        :references => ["https://apps.support.sap.com/sap/support/knowledge/en/1749574"],
        :match_type => :content_body,
        :match_content => /urn:CTCWebServiceSi/i,
        :paths => [{ :path => "#{url}/CTCWebService/CTCWebServiceBean?wsdl", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"cookie",
        :version => nil,
        :references => [
          "https://apps.support.sap.com/sap/support/knowledge/preview/en/2082323",
          "https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/sap/sap_soap_rfc_pfl_check_os_file_existence.rb"
        ],
        :match_type => :content_cookies,
        :match_content =>  /sap-usercontext=sap-language=/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"cookie",
        :version => nil,
        :references => [],
        :match_type => :content_cookies,
        :match_content =>  /com.sap.engine.security.authentication.original_application_url/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"title",
        :version => nil,
        :references => [],
        :match_type => :content_title,
        :match_content =>  /SAP NetWeaver Application Server Java/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :match_details =>"title",
        :version => nil,
        :references => [],
        :match_type => :content_title,
        :match_content =>  /SAP&#x20;NetWeaver&#x20;Portal/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :version => nil,
        :match_details =>"server header",
        :references => [],
        :match_type => :content_headers,
        :match_content =>  /server: SAP NetWeaver Application Server [\d\.]*.*/i,
        :dynamic_version => lambda { |x| _first_header_capture(x, /server: SAP NetWeaver Application Server ([\d\.]+)/i) },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"NetWeaver",
        :version => nil,
        :match_details =>"location header",
        :references => [
          "https://blogs.sap.com/2016/05/19/hp-loadrunner-scripts-for-webui/"
        ],
        :match_type => :content_headers,
        :match_content =>  /bD1lbiZjPTEwMCZkPW1pbg==/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor =>"SAP",
        :product =>"XSEngine",
        :version => nil,
        :match_details =>"title",
        :match_type => :content_title,
        :match_content =>  /SAP XSEngine/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
