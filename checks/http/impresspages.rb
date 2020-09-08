module Intrigue
module Ident
module Check
class ImpressPages < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "ImpressPages",
        :product => "ImpressPages CMS",
        :website => "http://www.impresspages.org/",
        :match_details =>"ImpressPages - generator page reference",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /<meta name="generator" content="ImpressPages/i,
        :dynamic_version => lambda {|x| 
            version = _first_body_capture(x,/<meta name="generator" content="ImpressPages (?:CMS\s)?(\d+(\.\d+)*)/i)
        },
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end
  
end
end
end
end
