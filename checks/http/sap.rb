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
        :paths => ["#{url}"],
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
        :paths => ["#{url}"],
        :inference => true
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
        :paths => ["#{url}"],
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
        :paths => ["#{url}"],
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
        :paths => ["#{url}"],
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
        :paths => ["#{url}"],
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
        :paths => ["#{url}"],
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
        :paths => ["#{url}"],
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
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
