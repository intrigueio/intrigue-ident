module Intrigue
module Ident
module Check
class Adobe < Intrigue::Ident::Check::Base

  ### 
  ### Handy: Metasploit: /modules/auxiliary/scanner/http/coldfusion_version.rb
  ###

  def generate_checks(url)
    [
      # TODO, put more work into finding coldfusion on the front page... 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Adobe",
        :product => "Coldfusion",
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /CFTOKEN=/,
        :match_details => "Adobe Coldfusion Cookie Match",
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      },
      { # Coldfusion  
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Adobe",
        :product => "Coldfusion",
        :version => nil,
        :match_type => :content_body,
        :match_content => /<meta name=\"Author\" content=\"Copyright \(c\) 1995\-2010 Adobe/,
        :match_details => "body content",
        :hide => false,
        :paths => ["#{url}/CFIDE/administrator/index.cfm"],
        :require_product => "Coldfusion",
        :inference => false
      },
      { # Coldfusion 6, 7  
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Adobe",
        :references => [
            "https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/http/coldfusion_version.rb"
        ],
        :product => "Coldfusion",
        :version => nil,
        :match_type => :content_cookies,
        :match_content => />\s*Version:\s.*<\/strong\><br\s\//,
        :dynamic_version => lambda {|x| 
            version = _first_body_capture(x,/>\s*Version:\s*(.*)<\/strong\><br\s\//)
            version =~ /^6/ ? "MX6 #{x}" : "MX7 #{x}"
         },
        :match_details => "Body content, version string",
        :hide => false,
        :paths => ["#{url}/CFIDE/administrator/index.cfm"],
        :require_product => "Coldfusion",
        :inference => true
      },
      { # Coldfusion 10 ... this needs OR/AND ?
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Adobe",
        :product => "Coldfusion",
        :version => "10",
        :match_type => :content_body,
        :match_content => /<meta name=\"Author\" content=\"Copyright \(c\) 1995\-2010 Adobe.*1997\-2012 Adobe Systems Incorporated and its licensors/m,
        :match_details => "body content",
        :hide => false,
        :paths => ["#{url}/CFIDE/administrator/index.cfm"],
        :require_product => "Coldfusion",
        :inference => true
      },
      { # Coldfusion 11 ... this needs OR/AND ?
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Adobe",
        :product => "Coldfusion",
        :version => "11",
        :match_type => :content_body,
        :match_content => /&copy; 1997 - 2014 Adobe Systems Incorporated and its licensors/m,
        :match_details => "body content",
        :hide => false,
        :paths => ["#{url}/CFIDE/administrator/index.cfm"],
        :require_product => "Coldfusion",
        :inference => true
      },
      # 
      { # Generic check 
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Adobe",
        :product => "Coldfusion",
        :version => nil,
        :dynamic_version => lambda { |x| 
            version = _first_body_capture(x,/<meta name=\"Keywords\" content=\"(.*)\">\s+<meta name/)
         },
        :match_type => :content_body,
        :match_content => /<meta name=\"Keywords\" content=\".*\">\s+<meta name/,
        :match_details => "body content",
        :hide => false,
        :paths => ["#{url}/CFIDE/administrator/index.cfm"],
        :require_product => "Coldfusion",
        :inference => true
      },

=begin
      # TODO .. implement array for match content (AND) and then grab the rest of these 
      # 
      # Check is disabled until we can find something better... ridiculous to make a 
      # check against every URL just because we havent yet found something on the base page for AEM
      {
        :type => "fingerprint",
        :category => "application",
        :vendor => "Adobe",
        :tags => ["CMS","Marketing"],
        :product => "Experience Manager",
        :version => nil,
        :match_type => :content_body,
        :match_content => /AEM/,
        :match_details => "Adobe Experience Manager",
        :hide => false,
        :paths => ["#{url}/libs/granite/core/content/login.html"],
        :inference => false
      },
=end    
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS", "Editor"],
        :vendor => "Adobe",
        :product => "Fireworks MX",
        :version => nil,
        :match_type => :content_body,
        :match_content => /Fireworks MX Dreamweaver MX/,
        :match_details => "generator string in the body",
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS","Marketing", "SaaS"],
        :vendor => "Adobe",
        :product => "Omniture DC",
        :version => nil,
        :dynamic_version => lambda { |x| _first_header_capture(x,/server: Omniture DC\/(.*)/) },
        :match_type => :content_headers,
        :match_content => /server: Omniture DC/,
        :match_details => "Omniture server header",
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
