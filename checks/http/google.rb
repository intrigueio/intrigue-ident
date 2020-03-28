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
          :paths => ["#{url}"],
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
          :paths => ["#{url}"],
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
          :paths => ["#{url}"],
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
          :paths => ["#{url}"],
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
          :paths => ["#{url}"],
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
          :paths => ["#{url}"],
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
          :paths => ["#{url}"],
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
          :paths => ["#{url}"],
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
          :paths => ["#{url}"],
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
        #  :paths => ["#{url}"],
        #  :inference => true
        #}
      ]
    end

  end
end
end
end
