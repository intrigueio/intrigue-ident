module Intrigue
module Ident
module Check
  class Google < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Marketing","Javascript"],
          :vendor => "Google",
          :product =>"Analytics",
          :match_details =>"UA string",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /getTracker\([\"|\']UA-/im,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Marketing","Javascript"],
          :vendor => "Google",
          :product =>"Analytics",
          :match_details =>"load string",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /www.google-analytics.com\/analytics.js','ga'/im,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Frontend","Javascript"],
          :vendor => "Google",
          :product =>"AngularJS",
          :match_details =>"body ng-app string",
          :version => nil,
          :match_type => :content_body,
          :match_content => /ng-app=\"/im,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Frontend","Javascript"],
          :vendor => "Google",
          :product =>"AngularJS",
          :match_details =>"body ng-app string",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /<ng-app/im,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Frontend","Javascript"],
          :vendor => "Google",
          :product =>"AngularJS",
          :match_details =>"body ng-app string",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /\*ngIf=/im,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Frontend","Javascript"],
          :vendor => "Google",
          :product =>"AngularJS",
          :match_details =>"body ng-app string",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /ng-controller=/im,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Development"],
          :vendor => "Google",
          :product => "Firebase",
          :website => "https://firebase.google.com/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /This is a custom domain, but we haven't finished setting it up yet./i,
          :match_details => "firebase error",
          :hide => false,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["IaaS", "SaaS"],
          :vendor => "Google",
          :product => "Google",
          :references => ["https://cloud.google.com/storage/docs/xml-api/reference-headers"],
          :match_details => "unique header",
          :match_type => :content_headers,
          :version => nil,
          :match_content =>  /^x-goog-stored-content-encoding:.*$/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["IaaS"],
          :vendor => "Gooogle",
          :product => "Google",
          :references => ["https://cloud.google.com/storage/docs/xml-api/reference-headers"],
          :match_details => "unique header",
          :match_type => :content_headers,
          :version => nil,
          :match_content =>  /^x-goog-generation:.*$/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["SaaS"],
          :vendor => "Google",
          :product => "Google",
          :match_details => "server header",
          :match_type => :content_headers,
          :version => nil,
          :match_content =>  /^server: ghs$/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["SaaS"],
          :vendor => "Google",
          :product => "Google",
          :match_details => "server header",
          :match_type => :content_headers,
          :version => nil,
          :match_content =>  /^server: GSE$/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["SaaS"],
          :vendor => "Google",
          :product => "Google",
          :match_details => "Google Missing Page",
          :match_type => :content_body,
          :version => nil,
          :match_content =>  /The requested URL <code>\/<\/code> was not found on this server\./,
          :hide => true,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Embedded", "Appliance","COTS"],
          :vendor => "Google",
          :product =>"Search Appliance",
          :match_details =>"server header reports google search appliance",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /server: Google Search Appliance/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Marketing","Javascript"],
          :vendor => "Google",
          :product =>"Tag Manager",
          :match_details =>"js load string",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /<!-- End Google Tag Manager -->/im,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Server", "Hosting", "SaaS"],
          :vendor => "Google",
          :product =>"Google Web Server",
          :match_details =>"Google web server header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^server: gws$/i,
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => false
        },
        # Currently match_content too loose, also no point in inference if we dont' have a versions
        #{
        #  :type => "fingerprint",
        #  :category => "application",
        #  :tags => ["CMS"],
        #  :vendor => "Google",
        #  :product => "blogger",
        #  :references => ["https://www.blogger.com/"],
        #  :version => nil,
        #  :match_type => :content_body,
        #  :match_content => /blogger/i,
        #  :dynamic_version => nil,
        #  :match_details => "header match",
        #  :hide => false,
        #  :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        #  :inference => true
        #}
      ]
    end

  end
end
end
end
