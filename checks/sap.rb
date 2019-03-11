module Intrigue
module Ident
module Check
    class Sap < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor =>"SAP",
            :product =>"NetWeaver",
            :match_details =>"cookie",
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
            :match_details =>"location header",
            :references => [
              "https://blogs.sap.com/2016/05/19/hp-loadrunner-scripts-for-webui/"
            ],
            :match_type => :content_headers,
            :match_content =>  /bD1lbiZjPTEwMCZkPW1pbg==/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
