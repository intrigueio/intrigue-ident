module Intrigue
module Ident
module Check
class Tengine < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer"],
        :vendor => "Taobao",
        :product => "Tengine",
        :references => ["https://tengine.taobao.org/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ Tengine\/{0,1}(\d{1,}\.\d{1,}\.\d{1,}){0,1}|Aserver$/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ Tengine\/{0,1}(\d{1,}\.\d{1,}\.\d{1,}){0,1}|Aserver$/i) },
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
