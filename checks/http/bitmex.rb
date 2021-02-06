module Intrigue
  module Ident
  module Check
  module Private
  class Bitmex < Intrigue::Ident::Check::Base
  
      def generate_checks(url)
      [
          {
              :type => "fingerprint",
              :category => "service",
              :tags => ["SaaS"],
              :vendor => "Bitmex",
              :product => "Bitmex",
              :website => "https://www.bitmex.com/",
              :match_details =>"Bitmex specific header?",
              :version => nil,
              :match_type => :content_headers,
              :match_content =>  /^x-powered-by: Profit$/i,
              :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
              :inference => false
          }
      ]
      end
  end
  end
  end
  end
  end