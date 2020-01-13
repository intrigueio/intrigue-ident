module Intrigue
module Ident
module Check
class Glimpse < Intrigue::Ident::Check::Base
  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor => "Glimpse",
        :product => "Glimpse",
        :match_details => "glimpse.axd version",
        :version => nil,
        :references => [
          "https://docs.microsoft.com/en-us/aspnet/mvc/overview/performance/profile-and-debug-your-aspnet-mvc-app-with-glimpse"
        ],
        :dynamic_version => lambda { |x| 
          _first_body_capture(x,/name="glimpseRuntimeVersion" value="([\d\.]*)"/) 
        },
        :match_type => :content_body,
        :match_content => /Glimpse - Configuration Page/,
        :paths => ["#{url}/glimpse.axd"],
        :require_product => "ASP.NET",
        :inference => true
      }
    ]
  end
end
end
end
end
