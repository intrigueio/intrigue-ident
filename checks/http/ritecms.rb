module Intrigue
module Ident
module Check
class RiteCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "RiteCMS",
        :product => "RiteCMS",
        :references => ["http://ritecms.com/"],
        :match_details => "RiteCMS - generator page reference",
        :version => nil,
        :match_type => :content_body,
        :match_content => /<meta name="generator" content="RiteCMS/i,
        :dynamic_version => lambda { |x| 
          _first_body_capture(x, /<meta name="generator" content="RiteCMS (\d+(\.\d+)*)/i)
        },
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end

end
end
end
end
