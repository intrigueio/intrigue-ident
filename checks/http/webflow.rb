module Intrigue
module Ident
module Check
class Webflow < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Web Framework", "Javascript"],
        :vendor =>"Webflow",
        :product =>"Webflow",
        :match_details =>"body string",
        :references => ["https://webflow.com"],
        :match_type => :content_body,
        :match_content =>  /data-wf-page=\"/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Web Framework", "Javascript"],
        :vendor =>"Webflow",
        :product =>"Webflow (missing page)",
        :match_details =>"missing page body string",
        :references => ["https://webflow.com"],
        :match_type => :content_body,
        :match_content =>  /w-section content-wrapper.*The page you are looking for doesn't exist or has been moved./mi,
        :paths => ["#{url}"],
        :hide => true,
        :inference => false
      }


      
    ]
  end

end
end
end
end
