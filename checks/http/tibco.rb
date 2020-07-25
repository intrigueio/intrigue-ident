module Intrigue
module Ident
module Check
class Tibco < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      { # check for jaasperreports when you see apache
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"location header (Professional Edition)",
        :version => nil,
        :match_type => :content_title,
        :match_content => /JasperServer/i,
        :paths => ["#{url}/jasperserver/login.html"],
        :require_product => "HTTP Server", # require apache 
        :inference => false
      }, 
      { # check for jaasperreports when you see nginx
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"location header (Professional Edition)",
        :version => nil,
        :match_type => :content_title,
        :match_content => /JasperServer/i,
        :paths => ["#{url}/jasperserver/login.html"],
        :require_product => "Nginx", # require nginx 
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"location header (Professional Edition)",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^Location: \/jasperserver-pro$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"linked javacript",
        :version => nil,
        :match_type => :content_body,
        :match_content => /src=\"\/jasperserver\/scripts\/jasperserver\.js/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"location header (Professional Edition)",
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /Path=\/jasperserver-pro\//i,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["API"],
        :vendor =>"TIBCO",
        :product =>"Mashery",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^server: Mashery Proxy$/i,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["API"],
        :vendor =>"TIBCO",
        :product =>"Mashery",
        :match_details =>"unique header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^x-mashery-error-code:.*$/i,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Analytics", "COTS"],
        :vendor =>"TIBCO",
        :product =>"Spotfire Server",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^server: TIBCO Spotfire Server$/i,
        :paths => ["#{url}"],
        :inference => false
      }
      
    ]
  end

end
end
end
end



