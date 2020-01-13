module Intrigue
module Ident
module Check
  class Generic < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "none",
          :vendor => "Generic",
          :product => "Error Page",
          :match_details =>"There's a generic error message in the title.",
          :version => nil,
          :hide => false,
          :match_type => :content_title,
          :match_content =>  /^Error$/i,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "none",
          :vendor => "Generic",
          :product => "Error Page",
          :match_details =>"There's a generic error message in the title.",
          :version => nil,
          :hide => false,
          :match_type => :content_title,
          :match_content =>  /^Service Unavailable$/i,
          :paths => ["#{url}"],
          :inference => false
        }, 
        {
          :type => "fingerprint",
          :category => "none",
          :vendor => "Generic",
          :product => "Unauthorized",
          :match_details =>"error in body",
          :version => nil,
          :hide => false,
          :match_type => :content_body,
          :match_content =>  /<STRONG>401 Unauthorized/,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "none",
          :vendor => "Generic",
          :product => "Unauthorized",
          :match_details =>"Title",
          :version => nil,
          :hide => false,
          :match_type => :content_title,
          :match_content =>  /^Access Denied$/,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "none",
          :vendor => "Generic",
          :product => "Under Construction",
          :match_details =>"under construction page",
          :version => nil,
          :hide => false,
          :match_type => :content_body,
          :match_content =>  /<HEAD><TITLE>Under construction/i,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "none",
          :vendor => "Generic",
          :product => "Load Balancer",
          :match_details =>"There's a semi-generic xserver header being sent from this asset.",
          :version => nil,
          :hide => false,
          :match_type => :content_headers,
          :match_content =>  /^xserver:/,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "none",
          :vendor => "Generic",
          :tags => ["Load Balancer"],
          :product => "Page Missing (404)",
          :match_details =>"Could be an API, or just serving something at another location. TODO ... is this ECS-specific? (check header)",
          :version => nil,
          :hide => true,
          :match_type => :content_body,
          :match_content =>  /<title>404 - Not Found<\/title>/,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end

  end
end
end
end
