module Intrigue
module Ident
module Check
class Splunk < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Security"],
        :vendor =>"Splunk",
        :product =>"Splunk",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^server: Splunkd$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
