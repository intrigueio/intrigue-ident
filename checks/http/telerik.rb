module Intrigue
module Ident
module Check
    class Telerik < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor => "Telerik",
            :product => "Sitefinity CMS",
            :match_details => "Telerik Sitefinity is an ASP.NET 2.0-based Content Management System (CMS)",
            :url => "https://www.sitefinity.com/",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /Telerik.Sitefinity.Resources/,
            :dynamic_version => lambda { |x|  
              _first_body_capture x, /Version=([\d\.]+),/ },
            :paths => ["#{url}"],
            :inference => true
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Database","COTS"],
            :vendor => "Telerik",
            :product => "Sitefinity CMS",
            :match_details => "Detect Telerik via a meta generator tag",
            :url => "https://www.sitefinity.com/",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<meta\ name=\"Generator\"\ content=\"Sitefinity/,
            :dynamic_version => lambda { |x| 
              _first_body_capture x, /<meta name=\"Generator\" content=\"Sitefinity ([\d\.]+).*\ \/>/ },
            :paths => ["#{url}"],
            :inference => true
          }
        ]
      end

    end
  end
  end
  end
