module Intrigue
module Ident
module Check
class Unbounce < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS"],
        :vendor =>"Unbounce",
        :product =>"Unbounce",
        :match_details =>"missing account string",
        :references => [],
        :match_type => :content_body,
        :match_content =>  /The requested URL was not found on this server./i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false,
        :hide => true
      }
    ]
  end

end
end
end
end
