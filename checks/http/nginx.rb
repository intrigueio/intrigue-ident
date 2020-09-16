module Intrigue
module Ident
module Check
class Nginx < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Nginx",
        :product =>"Nginx",
        :match_details =>"Nginx default page",
        :version => nil,
        :match_type => :content_title,
        :match_content =>  /^Welcome to nginx\!?$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Nginx",
        :product =>"Nginx",
        :match_details =>"Nginx test page",
        :version => nil,
        :match_type => :content_title,
        :match_content =>  /^Test Page for the Nginx HTTP Server/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Nginx",
        :product =>"Nginx",
        :match_details =>"Nginx (no version)",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: nginx$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Nginx",
        :product =>"Nginx",
        :match_details =>"Nginx (with version)",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:.*nginx\/([\d\.]*).*/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:.*nginx\/([\d\.]*).*/i) },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Nginx",
        :product =>"Nginx",
        :match_details =>"nginx (default 404 page)",
        :match_type => :content_body,
        :match_content => /<hr><center>nginx<\/center>/i,
        :hide => true,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
