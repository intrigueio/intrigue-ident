module Intrigue
module Ident
module Check
class Dynatrace < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["APM","Javascript"],
        :vendor =>"Dynatrace",
        :product =>"Dynatrace",
        :match_details =>"x-ruxit-js-agent header",
        :references => ["http://ruxit.com"],
        :match_type => :content_headers,
        :match_content =>  /^x-ruxit-js-agent:.*/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["APM","Javascript"],
        :vendor =>"Dynatrace",
        :product =>"Dynatrace",
        :match_details =>"x-dynatrace-js-agent header",
        :references => ["http://ruxit.com"],
        :match_type => :content_headers,
        :match_content =>  /^x-ruxit-js-agent:.*/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
