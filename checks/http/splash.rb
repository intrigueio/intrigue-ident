
module Intrigue
  module Ident
  module Check
  class Splash < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Marketing", "Javascript", "SaaS"],
          vendor:"Splash",
          product:"Splash",
          description:"title for default landing page",
          version: nil,
          match_type: :content_title,
          match_content:  /Event Marketing Software - Splash/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        }
      ]
    end
  
  end
  end
  end
  end
  