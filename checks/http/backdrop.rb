module Intrigue
module Ident
module Check
class Basekit < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Basekit",
        :product => "Basekit",
        :references => ["https://www.basekit.com/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /BaseKit/i,
        :dynamic_version => nil,
        :match_details => "header match",
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
