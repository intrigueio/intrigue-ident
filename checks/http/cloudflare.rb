module Intrigue
module Ident
module Check
class Cloudflare < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare Error",
        :version => nil,
        :match_type => :content_body,
        :match_content => /<title>403 Forbidden<\/title>.*<center>cloudflare<\/center>/mi,
        :match_details =>"cloudflare known error",
        :hide => true,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :version => nil,
        :match_type => :content_body,
        :match_content => / network. A valid Host header must be supplied to reach the desired website./mi,
        :match_details =>"cloudflare missing page error",
        :hide => true,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :version => nil,
        :match_type => :content_title,
        :match_content => /\| 525: SSL handshake failed/mi,
        :match_details =>"cloudflare missing handshake error",
        :hide => true,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare Error",
        :version => nil,
        :match_type => :content_title,
        :match_content => /DNS resolution error \| [\d\w\.]+ \| Cloudflare/i,
        :match_details =>"cloudflare known error",
        :hide => true,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare Error",
        :version => nil,
        :match_type => :content_body,
        :match_content => /<title>Direct IP access not allowed \| Cloudflare/,
        :match_details =>"cloudflare known error",
        :hide => true,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :match_details =>"Cloudflare Error",
        :version => "",
        :match_type => :content_body,
        :match_content =>  /cferror_details/,
        :hide => true,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :match_details =>"Error - Direct IP Access",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /403\ Forbidden<\/h1><\/center>\n<hr><center>cloudflare<\/center>/im,
        :hide => true,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /__cfduid/i,
        :match_details =>"cloudflare cookie",
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^cfray:/i,
        :match_details =>"header",
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^cf-ray:/i,
        :match_details =>"header",
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /cloudflare-nginx/i,
        :match_details =>"cloudflare nginx header",
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: cloudflare$/i,
        :match_details =>"server header",
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "Cloudflare",
        :product => "Cloudflare",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^expect-ct:.*cloudflare.com.*$/i,
        :match_details =>"ct header pointed to cloudflare",
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
