module Intrigue
module Ident
module Check
class Verizon < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN", "WAF"],
        :vendor =>"Verizon",
        :product =>"Edgecast",
        :match_details =>"unique header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /ECD \(.*?\)/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
