module Intrigue
module Ident
module Check
class Varnish < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server", "Cache"],
        :vendor =>"Varnish-Cache",
        :product =>"Varnish",
        :match_details =>"Varnish Proxy",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: Varnish$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server", "Cache"],
        :vendor =>"Varnish-Cache",
        :product =>"Varnish",
        :match_details =>"Varnish Proxy",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-varnish:.*$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server", "Cache"],
        :vendor =>"Varnish-Cache",
        :product =>"Varnish",
        :match_details =>"Varnish Proxy",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^via: varnish$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server", "Cache"],
        :vendor =>"Varnish-Cache",
        :product =>"Varnish",
        :match_details =>"Varnish Proxy",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^via: [0-9\.]+ varnish$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server", "Cache"],
        :vendor =>"Varnish-Cache",
        :product =>"Varnish",
        :match_details =>"Varnish Proxy",
        :version => 4,
        :match_type => :content_headers,
        :match_content =>  /^via: [0-9\.]+ varnish-v4\,.*$/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
