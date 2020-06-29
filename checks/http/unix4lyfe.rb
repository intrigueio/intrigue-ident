module Intrigue
module Ident
module Check
class Unix4lyfe < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Unix4lyfe",
        :product => "DarkHTTPd",
        :website => "https://unix4lyfe.org/darkhttpd/",
        :match_type => :content_headers,
        :match_content => /Server: darkhttpd.*/i,
        :dynamic_version => lambda { |x| _first_header_capture(x, /Server: darkhttpd\/([\d\.]+)/i)},
        :match_details => "server header",
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