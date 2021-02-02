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
        :match_details =>"login page (Professional Edition)",
        :version => nil,
        :match_type => :content_body,
        :match_content => /loginPage/i,
        :paths => [{ :path => "#{url}/jasperserver/login.html", :follow_redirects => true } ],
        :require_product => "HTTP Server", # require apache 
        :inference => false,
        :issues => ["exposed_jaspersoft_panel"]
      }, 
      { # check for jaasperreports when you see nginx
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development","Panel"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"login page (Professional Edition)",
        :version => nil,
        :match_type => :content_body,
        :match_content => /loginPage/i,
        :paths => [{ :path => "#{url}/jasperserver/login.html", :follow_redirects => true } ],
        :require_product => "Nginx", # require nginx 
        :inference => false,
        :issues => ["exposed_jaspersoft_panel"]
      }, 
      { # check for jaasperreports PRO when you see apache
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development","Panel"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"login page (Professional Edition)",
        :version => nil,
        :match_type => :content_body,
        :match_content => /loginPage/i,
        :paths => [{ :path => "#{url}/jasperserver-pro/login.html", :follow_redirects => true } ],
        :require_product => "HTTP Server", # require apache 
        :inference => false,
        :issues => ["exposed_jaspersoft_panel"]
      }, 
      { # check for jaasperreports PRO when you see nginx
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development","Panel"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"login page (Professional Edition)",
        :version => nil,
        :match_type => :content_body,
        :match_content => /loginPage/i,
        :paths => [{ :path => "#{url}/jasperserver-pro/login.html", :follow_redirects => true } ],
        :require_product => "Nginx", # require nginx 
        :inference => false,
        :issues => ["exposed_jaspersoft_panel"]
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development","Panel"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"location header (Professional Edition)",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^Location: \/jasperserver-pro$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => false } ],
        :inference => false,
        :issues => ["exposed_jaspersoft_panel"]
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
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false,
        :issues => ["exposed_jaspersoft_panel"]
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development"],
        :vendor =>"TIBCO",
        :product =>"JasperReports Server",
        :match_details =>"jasperserver-pro cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /Path=\/jasperserver-pro\//i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false,
        :issues => ["exposed_jaspersoft_panel"]
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
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
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
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
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
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
      
    ]
  end

end
end
end
end



