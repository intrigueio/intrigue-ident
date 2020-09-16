module Intrigue
module Ident
module Check
class NationBuilder < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CMS"],
        :website => "",
        :vendor => "NationBuilder",
        :product => "NationBuilder",
        :references => [],
        :version => nil,
        :match_type => :content_body,
        :match_content => />Created with NationBuilder<\/a>/i,
        :match_details => "created by string",
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end
  
end
end
end
end
