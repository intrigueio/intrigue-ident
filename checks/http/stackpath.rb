module Intrigue
module Ident
module Check
class StackPath < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN", "WAF"],
        :vendor => "StackPath",
        :product => "NetDNA",
        :references => ["https://www.stackpath.com/products/cdn/"],
        :match_details =>"NetDNA - server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ NetDNA-cache/,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ NetDNA-cache\/(\d+(\.\d+)*)$/i) },
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
