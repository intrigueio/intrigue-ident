module Intrigue
module Ident
module Check
class DanneoCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Danneo",
        :product => "Danneo",
        :references => ["http://danneo.ru/"],
        :match_details => "Danneo - generator page reference",
        :version => nil,
        :match_type => :content_body,
        :match_content => /<meta name="generator" content="CMS Danneo/i,
        :dynamic_version => lambda { 
          |x| _first_body_capture(x, /<meta name="generator" content="CMS Danneo (\d+(\.\d+)*)/i)
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
