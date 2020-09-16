module Intrigue
module Ident
module Check
class RedHat < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      { # The requested URL /doesntexist-123 was not found on this server.</p>\n<hr>\n
        # <address>Apache/2.2.15 (Red Hat) Server at jasper.emory.edu Port 443</address>
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["OS"],
        :vendor =>"Red Hat",
        :product =>"Linux",
        :match_details =>"apache error page",
        :match_type => :content_body,
        :match_content => /Apache.* \(Red Hat\) Server.*/i,
        :paths =>[{ :path => "#{url}/doesntexist-123", :follow_redirects => true } ],
        :inference => false
      },
      { # server: Apache/2.4.6 (Red Hat Enterprise Linux) OpenSSL/1.0.2k-fips PHP/7.2.12
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["OS"],
        :vendor =>"Red Hat",
        :product =>"Enterprise Linux",
        :match_details =>"nginx test page",
        :match_type => :content_headers,
        :match_content =>  /^Apache.* \(Red Hat Enterprise Linux\).*$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["OS"],
        :vendor =>"Red Hat",
        :product =>"Fedora Linux",
        :match_details =>"nginx test page",
        :match_type => :content_title,
        :match_content =>  /^Test Page for the Nginx HTTP Server on Fedora$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development", "Administrative", "Hypervisor"],
        :vendor =>"Red Hat",
        :product =>"OpenShift Container Platform",
        :match_details =>"error message in html",
        :references => ["https://bugzilla.redhat.com/show_bug.cgi?id=1414657"],
        :match_type => :content_body,
        :match_content =>  /Route and path matches, but all pods are down./i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development", "Administrative", "Hypervisor"],
        :vendor =>"Red Hat",
        :product =>"OpenShift Container Platform",
        :match_details =>"title",
        :references => [""],
        :match_type => :content_title,
        :match_content =>  /Login - OpenShift Origin/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Red Hat",
        :product => "JBoss Core Services",
        :references => ["https://www.redhat.com/en/resources/jboss-core-services-collection-datasheet"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^Server:\ JBCS\ httpd$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^Server:\ JBCS\ httpd$/i) },
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Red Hat",
        :product => "JBoss Enterprise Application Platform",
        :references => [""],
        :version => nil,
        :match_type => :content_headers,
        :match_details =>"powered by header",
        :match_content => /^x-powered-by:.*JBoss-[\d\.]+\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^x-powered-by:.*JBoss-([\d\.]+)\/.*$/i) },
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "Red Hat",
        :product => "JBoss Enterprise Application Platform",
        :match_details =>"powered by header",
        :references => ["https://bugzilla.redhat.com/show_bug.cgi?id=1049103"],
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^X-Powered-By: JSP\/2./i,
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Red Hat",
        :product => "JBoss Web Server",
        :match_details =>"powered by header",
        :references => ["https://www.redhat.com/en/technologies/jboss-middleware/web-server"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-powered-by:.*JBossWeb-[\d\.]+$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^x-powered-by:.*JBossWeb-([\d\.]+)$/i) },
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end

end
end
end
end
