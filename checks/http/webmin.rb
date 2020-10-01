module Intrigue
module Ident
module Check
class Webmin < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative"],
        :vendor =>"Webmin",
        :product =>"Webmin",
        :match_details => "miniserv server",
        :match_type => :content_headers,
        :references => [],
        :match_content => /server: MiniServ/i,
        :version => nil,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/server: MiniServ\/(.*)/i)},
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative"],
        :vendor =>"Webmin",
        :product =>"Webmin",
        :match_details => "page title",
        :match_type => :content_body,
        :references => [],
        :match_content => /<title>Login to Webmin/,
        :version => nil,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false,
        :issue => "exposed_admin_panel_unauthenticated"
      }
    ]
  end

end
end
end
end
