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
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ NetDNA-cache\/(\d+(\.\d+)*)$/,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ NetDNA-cache\/(\d+(\.\d+)*)$/i) },
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
