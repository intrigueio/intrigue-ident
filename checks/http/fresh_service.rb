module Intrigue
  module Ident
  module Check
    class FreshService < Intrigue::Ident::Check::Base
  
      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Support","SaaS"],
            :vendor => "FreshService",
            :product =>"FreshService",
            :references => [],
            :match_details =>"missing helpdesk (title)",
            :version => nil,
            :match_type => :content_title,
            :match_content =>  /^There is no helpdesk here\!$/i,
            :paths => ["#{url}"],
            :issue => { name: "subdomain_takeover", details: { service: "FreshService" } }, 
            :hide => true
          }
        ]
      end
  
    end
  end
  end
  end
  